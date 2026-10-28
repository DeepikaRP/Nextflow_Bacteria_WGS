include {FASTQC} from './modules/FASTQC'
include {FASTP} from './modules/FASTP'
include {REF_INDEX} from './modules/REF_INDEX'
include {ALIGN} from './modules/ALIGN'

workflow {
    reads_ch = Channel
        .fromFilePairs("data/fastq/*_{1,2}.fastq", checkIfExists : true)
	fasta_ch = Channel
		.fromPath("data/ref/*.fasta", checkIfExists : true)
		
    reads_ch.view{"sample : $it"}
	fasta_ch.view{"sample : $it"}
	
    FASTQC(reads_ch)
    FASTP(reads_ch)
	REF_INDEX(fasta_ch)
	ALIGN(FASTP.out.trimmed_fastq.map {sample_id, r1, r2 -> tuple(sample_id, [r1, r2])}, 
		fasta_ch, 
		REF_INDEX.out.index_ref)
	ALIGN.out.bam_flagstat
		.map {report -> report.text}
		.view {report}
	ALIGN.out.bam_stat
		.map {stats -> stats.text}
}
