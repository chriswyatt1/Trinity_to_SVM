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
        path("./FIGURES/Figure_of_Classifiers/${name}/Classification_confidence_leave-one-out-${name}.ChrisCorrect.queen.${test}.pdf") , emit: figures
	    path("./FIGURES/Figure_of_Classifiers/${name}/Train_table_with_significance.cpm.${test}.tsv") , emit: result

    script:
    """
	    Master.ML.pl -j ${name} -CPM $cpm -f $test -b $background -e $params.datafolder -orth $orth -r
        cp ./FIGURES/Figure_of_Classifiers/${name}/Classification_confidence_leave-one-out-${name}.ChrisCorrect.queen.pdf ./FIGURES/Figure_of_Classifiers/${name}/Classification_confidence_leave-one-out-${name}.ChrisCorrect.queen.${test}.pdf
        cp ./FIGURES/Figure_of_Classifiers/${name}/Train_table_with_significance.cpm.tsv ./FIGURES/Figure_of_Classifiers/${name}/Train_table_with_significance.cpm.${test}.tsv

    """
}
