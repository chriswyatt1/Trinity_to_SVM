Nextflow pipeline to automate SVM predictions from Wyatt et al. 2020 (https://www.biorxiv.org/content/10.1101/2020.12.08.407056v2).

Requirements:
Git

#Step 1. Git clone the repo to your local or university cluster.

`git clone https://github.com/chriswyatt1/Trinity_to_SVM`

#Step 2. Step up your environment

You have a choice whether to run locally or on a computer cluster. 

To run on a Sun Grid Engine cluster, we can use the profile flag in step 3:

`-profile myriad` # This flag allows a configuration on sun grid engine.

For other cluster type, please ask us, and we can try to help. Create an issue, if you wish.

If locally, then you don't need to set the -profile flag.

#Step 3. Run the script

To run the papers data , enter in your terminal:

`nextflow run main.nf -bg`

This will run an example dataset though the pipeline, locally on your machine. This could potentially take days, so normally this is better run on a high performance university cluster (see step 2).






