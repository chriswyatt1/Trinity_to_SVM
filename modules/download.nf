process DOWNLOAD {
    label 'download'
    stageInMode 'copy'
               
    output:
        path("") , emit: fasta_files

    script:
    """
	      wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE159nnn/GSE159973/suppl/GSE159973_FASTA_files.tar.gz
    """
}
