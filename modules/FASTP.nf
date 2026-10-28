process FASTP { 
	publishDir 'results/fastqc', mode: 'copy' 
	
	input: 
	tuple val(sample_id), path(reads)
	
	output:
	tuple val(sample_id), path("${sample_id}_1_trimmed.fastq"), path("${sample_id}_2_trimmed.fastq"), emit: trimmed_fastq
	path("*.fastp.html"), emit:html
	path("*.fastp.json"), emit:json
	
	script:
	"""
	fastp -i ${reads[0]} -I ${reads[1]} -l 50 -u 10 -o ${sample_id}_1_trimmed.fastq -O ${sample_id}_2_trimmed.fastq -h ${sample_id}.fastp.html -j ${sample_id}.fastp.json
	"""
}
