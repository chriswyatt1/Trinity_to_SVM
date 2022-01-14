Nextflow pipeline to automate the svm predictions in the Biorxiv publication Wyatt et al. 2020 (Wasp SVM) 

To run the papers data , enter in terminal:
`nextflow run main.nf -bg --data /path/to/DATA`

Where DATA, is the data folder downloaded from SRA :

    wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE159nnn/GSE159973/suppl/GSE159973_FASTA_files.tar.gz
	tar -xf GSE159973_FASTA_files.tar.gz
	wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE159nnn/GSE159973/suppl/GSE159973_RSEM_results.tar.gz
	tar -xf GSE159973_RSEM_results.tar.gz   

To run locally withing a docker container choose -profile docker
To run on a Sun Grid Engine cluster (e.g. Myriad UCL). Where the executer is `sge`, choose -profile myriad. 

e.g. `nextflow run main.nf -bg --data /path/to/DATA -profile myriad`