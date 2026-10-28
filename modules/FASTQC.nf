process FASTQC {
    publishDir 'results/fastqc'
    input:
    tuple val(sample_id), path(reads)

    output:
    path("*_fastqc.html"), emit:html
	path("*_fastqc.zip"), emit:zip

    script:
    """
    fastqc ${reads}
    """
}
