include {FASTQC} from './modules/FASTQC.nf'
workflow {
    reads_ch = Channel
        .fromPath("data/fastq/*.fastq", checkIfExists : true)
    reads_ch.view{"sample : $it"}
    FASTQC(reads_ch)
}
