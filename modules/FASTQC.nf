process FASTQC {
    publishDir 'results/fastqc'
    input:
    path(reads)

    output:
    path ("*_fastqc.txt"), emit:html
	path("*_fastqc.zip"), emit:zip

    script:
    """
    fastqc ${reads}
    """
}
