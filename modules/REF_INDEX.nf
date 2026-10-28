process REF_INDEX {
	publishDir 'data/ref', mode: 'copy'
	input: 
	path reference
	
	output:
	path("${reference}.*"), emit:index_ref
	
	script:
	"""
	bwa index ${reference}
	"""
}
