process ALIGN {
	publishDir 'results/align', mode: 'copy'
	input:
	tuple val(sample_id), path(reads) 
	path(reference) 
	path(index_ref)
	
	output:
	tuple val(sample_id),
	path("${sample_id}.sam"), emit:sam_file
	path("${sample_id}.bam"), emit:bam_file
	path("${sample_id}_sorted.bam"), emit:bam_sorted
	path("${sample_id}_sorted.bam.bai"), emit:bam_bai
	path("${sample_id}_flagstat.txt"), emit:bam_flagstat
	
	
	script:
	"""
	bwa mem ${reference} ${reads[0]} ${reads[1]} > ${sample_id}.sam 
	samtools view -b ${sample_id}.sam > ${sample_id}.bam 
	samtools sort ${sample_id}.bam -o ${sample_id}_sorted.bam
	samtools index ${sample_id}_sorted.bam
	samtools flagstat ${sample_id}_sorted.bam > ${sample_id}_flagstat.txt
	samtools stats ${sample_id}_sorted.bam > ${sample_id}_bam_stat.txt
	"""
}
