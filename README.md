# Nextflow pipeline (Transcriptome assemblies to SVM of castes)

A Nextflow pipeline to run SVM on Trinity assembly data, categorising caste in pairs of samples (1 Queen and 1 Worker per species). To understand the structure of the main script, refer to https://github.com/Sumner-lab/Multispecies_paper_ML. This Nextflow script acts as a way to run the papers data without seeing the code structure.

The script will create the Multispecies paper SVM progressive filtering plots and associated tables (Wyatt et al. Unpublished). 

Running the Nextflow pipeline with default settings will download the public data from the paper, including the Trinity assemblies and RSEM counts. Then perform SVM machine learning, across multiple species each with a single replicate for queen (1) or worker (0). 

Please contact the authors if you wish to embark on a similar analysis, as likely the scripts would have to be changed for another specific analysis.

# Nextflow pipeline to replicate SVM analysis

Nextflow pipeline to automate SVM predictions from Wyatt et al. 2020 (https://www.biorxiv.org/content/10.1101/2020.12.08.407056v2).

**Requirements:**
Git
Docker (if run locally) / Singularity (for a university cluster). 
-> This will pull the container `chriswyatt/perl_r_e1071:latest`, so you don't need to worry about installing any packages to get the program to work

**Step 1. Git clone the repo to your local or university cluster.**

`git clone https://github.com/chriswyatt1/Trinity_to_SVM`

`cd Trinity_to_SVM`

**Step 2. Step up your environment**

You have a choice whether to run locally with docker or on a computer cluster with singularity. 

To run on a Sun Grid Engine cluster, we can use the nextflow profile flag in step 3:

`-profile myriad` # This flag allows a configuration on sun grid engine.

For other cluster type, please ask us, and we can try to help. Create an issue, if you wish.

If locally, then you need to set the -profile flag to docker (and have docker installed and activated on your machine).

`-profile docker`

**Step 3. Run the script**

To run the papers data , enter in your terminal:

`nextflow run main.nf -bg`

This download the data from NCBI, then run an example SVM test. This could potentially take days, so normally this is better run on a high performance university cluster (see step 2).

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

`Master.ML.pl -j ${name} -CPM $cpm -f $test -b $background -e $params.datafolder -orth $params.orthofinder -r`

Which will be with default parameters listed above:

`Master.ML.pl -j Default -CPM 10 -f Angiopolybia_pallens -b Vespula_vulgaris,Vespa_crabro,Metapolybia_cingulata,Polybia_quadracincta -e Experimental_data_merged -orth DATA/Orthofinder/Orthogroups.copy.noMac.csv.filt3.csv -r`

`-r` is to tell the script to execute, and not just perform a dry run.

To change the parameters in Nextflow, listed above, you need to use two dashes (--). 

E.g. to change the tested species to Polstes_canadensis, I would submit:

`nextflow run main.nf -bg --test Polistes_canadensis`

Though I would also like to change the output folde name, so it does not write over an existing analysis:

`nextflow run main.nf -bg --test Polistes_canadensis --name Polistes_test`

If I wanted to configure this to run on Sun Grid engine, I need to use the single dash (-), that is reserved for the Nextflow parameters, not the ones defined in the script (e.g. --name and --cpm). e.g.:

`nextflow run main.nf -bg -profile myriad --test Polistes_canadensis --name Polistes_test`


**Output**

Once it has completed you should have a results folder, with the progressive filtering SVM classification plots from Figure 4, plus tables that describe the numbers and genes used in each model.

