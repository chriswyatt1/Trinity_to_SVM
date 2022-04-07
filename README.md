Nextflow pipeline to automate SVM predictions from Wyatt et al. 2020 (https://www.biorxiv.org/content/10.1101/2020.12.08.407056v2).

**Requirements:**
Git
Docker (if locally) / Singularity (for a university cluster). This will pull the container `chriswyatt/perl_r_e1071:latest`, so you don't need to worry about installing any packages to get the program to work

**Step 1. Git clone the repo to your local or university cluster.**

`git clone https://github.com/chriswyatt1/Trinity_to_SVM`

**Step 2. Step up your environment**

You have a choice whether to run locally or on a computer cluster. 

To run on a Sun Grid Engine cluster, we can use the nextflow profile flag in step 3:

`-profile myriad` # This flag allows a configuration on sun grid engine.

For other cluster type, please ask us, and we can try to help. Create an issue, if you wish.

If locally, then you don't need to set the -profile flag.

**Step 3. Run the script**

To run the papers data , enter in your terminal:

`nextflow run main.nf -bg`

This will run an example dataset though the pipeline, locally on your machine. This could potentially take days, so normally this is better run on a high performance university cluster (see step 2).

These are the flags you can change in the script:

```
params.name="Default"
params.outdir = "Results_of_SVM"
params.test="Angiopolybia_pallens"
params.back="Vespula_vulgaris,Vespa_crabro,Metapolybia_cingulata,Polybia_quadracincta"
params.cpm=10
params.data="DATA"
params.datafolder="Experimental_data_merged"
params.orthofinder="DATA/Orthofinder/Orthogroups.copy.noMac.csv.filt3.csv"
```

`name` is a user chosen name for the output name

`outdir` is the chosen out directory

`test` is the species name you want to test (ie not the training data)

`back` is the background data you want to use to train the SVM

`cpm` is the filter for counts per million, you can use to remove lowly expressed genes in the matrix of normalised counts

`data` is the folder where the data are stored, e.g. Trinity assemblies and RSEM counts, in sepcific nested folders. This st5ucture has to be preserved.

`datafolder` is the name of the folder where the reads are. Most are default, so just leave as they are.

`orthofinder` is the name of the exact orthofinder table used to determine the orthology between the genes in different species.

The above default running of nextflow would run the following SVM perl script:

``
