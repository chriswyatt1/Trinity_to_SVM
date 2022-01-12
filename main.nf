/*
 * Copyright (c) 2021
 */
 

 /*
 * Authors:
 * - Chris Wyatt <chris.wyatt@seqera.io>
 */

/* 
 * enable modules 
 */
nextflow.enable.dsl = 2

/*
 * Default pipeline parameters (on test data). They can be overriden on the command line eg.
 * given `params.genome` specify on the run command line `--genome /path/to/Duck_genome.fasta`.
 */

params.name="Default"
params.outdir = "Results_of_SVM"
params.test="Angiopolybia_pallens"
params.back="Vespula_vulgaris,Vespa_crabro,Metapolybia_cingulata,Polybia_quadracincta"
params.cpm=10
params.data="DATA"
params.datafolder="Experimental_data_merged"
params.orthofinder="DATA/Orthofinder/Orthogroups.copy.noMac.csv.filt3.csv"
params.scri="scripts"

log.info """\
 ===================================
 name of run                             : ${params.name}
 out directory                        : ${params.outdir}
 """

//================================================================================
// Include modules
//================================================================================

include { SVM } from './modules/svm.nf'
include { DOWNLOAD } from './modules/download.nf'

in_name = channel
	.from(params.name)
	.ifEmpty { error "Cannot find the name of run: ${params.name}" }

in_test = channel
        .from(params.test)
        .ifEmpty { error "Cannot find the test name: ${params.test}" }

in_back = channel
        .from(params.back)
        .ifEmpty { error "Cannot find the background names: ${params.back}" }
  
in_cpm = channel
        .from(params.cpm)
        .ifEmpty { error "Cannot find the counts per million filter: ${params.cpm}" }

in_data = channel
        .fromPath(params.data)
        .ifEmpty { error "Cannot find the name of the data folder: ${params.data}" }

in_scri = channel
        .fromPath(params.scri)
        .ifEmpty { error "Cannot find the scripts folder: ${params.scri}" }

workflow {
	DOWNLOAD ()
	SVM ( in_name , in_test , in_back , in_cpm , DOWNLOAD.out.in_data , in_scri )
}

workflow.onComplete {
	println ( workflow.success ? "\nDone! Open your report in your browser --> $params.outdir/report.html (if you added -with-report flag)\n" : "Hmmm .. something went wrong" )
}
