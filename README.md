Nextflow pipeline to automate SVM predictions from Wyatt et al. 2020 (https://www.biorxiv.org/content/10.1101/2020.12.08.407056v2) 

To run the papers data , enter in terminal:

`nextflow run main.nf -bg`

This will run an example dataset though the pipeline, locally on your machine. This could potentially take days, so normally this is better run on a high performance university cluster. 

To run on a Sun Grid Engine cluster, we can use the profile flag:

`-profile myriad` # This flag allows a configuration on sun grid engine.

For othe clusters, please ask us, and we can try to help. Create an issue, if you wish.

Currently, the Nextflow config is adjusted to run on a Sun Grid Engine cluster. For local execution or other compute server, we need to change the nextflow.config
