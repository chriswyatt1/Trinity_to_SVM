process DOWNLOAD {
    label 'download'
    stageInMode 'copy'
               
    output:
        path("") , emit: fasta_files

    script:
    """
	wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE159nnn/GSE159973/suppl/GSE159973_FASTA_files.tar.gz
	tar -xf GSE159973_FASTA_files.tar.gz
	wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE159nnn/GSE159973/suppl/GSE159973_RSEM_results.tar.gz
	tar -xf 
	mkdir DATA
	mkdir DATA/Experimental_data_merged
	
	mkdir DATA/Experimental_data_merged/Agelaia_cajannensis
	mkdir DATA/Experimental_data_merged/Agelaia_cajannensis/Pool
	mkdir DATA/Experimental_data_merged/Agelaia_cajannensis/Queen
	mkdir DATA/Experimental_data_merged/Agelaia_cajannensis/Worker
	mv Agelaia_trinity.fnn.fasta DATA/Experimental_data_merged/Agelaia_cajannensis/Pool/Pool_trinity.fnn
	mv Agelaia_cajannensis_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Agelaia_cajannensis/Queen/RSEM.isoforms.results
	mv Agelaia_cajannensis_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Agelaia_cajannensis/Worker/RSEM.isoforms.results
	
	mkdir DATA/Experimental_data_merged/Angiopolybia_pallens
	mkdir DATA/Experimental_data_merged/Angiopolybia_pallens/Pool
	mkdir DATA/Experimental_data_merged/Angiopolybia_pallens/Queen
	mkdir DATA/Experimental_data_merged/Angiopolybia_pallens/Worker
	mv Agelaia_trinity.fnn.fasta DATA/Experimental_data_merged/Angiopolybia_pallens/Pool/Pool_trinity.fnn
	mv Angiopolybia_pallens_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Angiopolybia_pallens/Queen/RSEM.isoforms.results
	mv Angiopolybia_pallens_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Angiopolybia_pallens/Worker/RSEM.isoforms.results

	mkdir DATA/Experimental_data_merged/Brachygastra_mellifica
	mkdir DATA/Experimental_data_merged/Brachygastra_mellifica/Pool
	mkdir DATA/Experimental_data_merged/Brachygastra_mellifica/Queen
	mkdir DATA/Experimental_data_merged/Brachygastra_mellifica/Worker
	mv Brachygastra_trinity.fnn.fasta  DATA/Experimental_data_merged/Brachygastra_mellifica/Pool/Pool_trinity.fnn
	mv Brachygastra_mellifica_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Brachygastra_mellifica/Queen/RSEM.isoforms.results
	mv Brachygastra_mellifica_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Brachygastra_mellifica/Worker/RSEM.isoforms.results
	
	mkdir DATA/Experimental_data_merged/Metapolybia_cingulata
	mkdir DATA/Experimental_data_merged/Metapolybia_cingulata/Pool
	mkdir DATA/Experimental_data_merged/Metapolybia_cingulata/Queen
	mkdir DATA/Experimental_data_merged/Metapolybia_cingulata/Worker
	mv Metapolybia_trinity.fnn.fasta  DATA/Experimental_data_merged/Metapolybia_cingulata/Pool/Pool_trinity.fnn
	mv Metapolybia_cingulata_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Metapolybia_cingulata/Queen/RSEM.isoforms.results
	mv Metapolybia_cingulata_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Metapolybia_cingulata/Worker/RSEM.isoforms.results

	mkdir DATA/Experimental_data_merged/Mischocyttarus_basimacula
	mkdir DATA/Experimental_data_merged/Mischocyttarus_basimacula/Pool
	mkdir DATA/Experimental_data_merged/Mischocyttarus_basimacula/Queen
	mkdir DATA/Experimental_data_merged/Mischocyttarus_basimacula/Worker
	mv Mischocyttarus_trinity.fnn.fasta  DATA/Experimental_data_merged/Mischocyttarus_basimacula/Pool/Pool_trinity.fnn
	mv Mischocyttarus_basimacula_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Mischocyttarus_basimacula/Queen/RSEM.isoforms.results
	mv Mischocyttarus_basimacula_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Mischocyttarus_basimacula/Worker/RSEM.isoforms.results

	mkdir DATA/Experimental_data_merged/Polistes_canadensis
	mkdir DATA/Experimental_data_merged/Polistes_canadensis/Pool
	mkdir DATA/Experimental_data_merged/Polistes_canadensis/Queen
	mkdir DATA/Experimental_data_merged/Polistes_canadensis/Worker
	mv Polistes_trinity.fnn.fasta  DATA/Experimental_data_merged/Polistes_canadensis/Pool/Pool_trinity.fnn
	mv Polistes_canadensis_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Polistes_canadensis/Queen/RSEM.isoforms.results
	mv Polistes_canadensis_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Polistes_canadensis/Worker/RSEM.isoforms.results

	mkdir DATA/Experimental_data_merged/Polybia_quadracincta
	mkdir DATA/Experimental_data_merged/Polybia_quadracincta/Pool
	mkdir DATA/Experimental_data_merged/Polybia_quadracincta/Queen
	mkdir DATA/Experimental_data_merged/Polybia_quadracincta/Worker
	mv Polybia_trinity.fnn.fasta  DATA/Experimental_data_merged/Polybia_quadracincta/Pool/Pool_trinity.fnn
	mv Polybia_quadracincta_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Polybia_quadracincta/Queen/RSEM.isoforms.results
	mv Polybia_quadracincta_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Polybia_quadracincta/Worker/RSEM.isoforms.results

	mkdir DATA/Experimental_data_merged/Vespa_crabro
	mkdir DATA/Experimental_data_merged/Vespa_crabro/Pool
	mkdir DATA/Experimental_data_merged/Vespa_crabro/Queen
	mkdir DATA/Experimental_data_merged/Vespa_crabro/Worker
	mv Vespa_trinity.fnn.fasta DATA/Experimental_data_merged/Vespa_crabro/Pool/Pool_trinity.fnn
	mv Vespa_crabro_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Vespa_crabro/Queen/RSEM.isoforms.results
	mv Vespa_crabro_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Vespa_crabro/Worker/RSEM.isoforms.results

	mkdir DATA/Experimental_data_merged/Vespula_vulgaris
	mkdir DATA/Experimental_data_merged/Vespula_vulgaris/Pool
	mkdir DATA/Experimental_data_merged/Vespula_vulgaris/Queen
	mkdir DATA/Experimental_data_merged/Vespula_vulgaris/Worker
	mv Vespula_trinity.fnn.fasta DATA/Experimental_data_merged/Vespula_vulgaris/Pool/Pool_trinity.fnn
	mv Vespula_vulgaris_Queen_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Vespula_vulgaris/Queen/RSEM.isoforms.results
	mv Vespula_vulgaris_Worker_RSEM.isoforms.results.txt DATA/Experimental_data_merged/Vespula_vulgaris/Worker/RSEM.isoforms.results

    """
}
