process SVM {
    label 'svm'
    publishDir "$params.outdir/SVM_results/"
    stageInMode 'copy'
    
    input:
        val name
        val test
	val background
	val cpm
	path data_folder
	path scripts
               
    output:
        path("./FIGURES/Figure_of_Classifiers/${name}/*.pdf") , emit: figures
	path("./FIGURES/Figure_of_Classifiers/${name}/*.tsv") , emit: result

    script:
    """
	Master.ML.pl -j ${name} -CPM $cpm -f $test -b $background -e $params.datafolder -orth $params.orthofinder -r
    """
}
