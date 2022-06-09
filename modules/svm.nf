process SVM {
    label 'svm'
    tag "RUN : $test"
    publishDir "$params.outdir/SVM_results/"
    stageInMode 'copy'
    
    input:
        val name
        val test
	val background
	val cpm
	path data_folder
	path scripts
	path orth
               
    output:
        path("./FIGURES/Figure_of_Classifiers/${name}/Classification_confidence_leave-one-out-Default.ChrisCorrect.queen.pdf") , emit: figures
	// path("./FIGURES/Figure_of_Classifiers/${name}/*.tsv") , emit: result

    script:
    """
	Master.ML.pl -j ${name} -CPM $cpm -f $test -b $background -e $params.datafolder -orth $orth -r
    """
}
