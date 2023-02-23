rule extract_chroms_from_reference:
        input:
                config["refAssembly"]
        output:
                REF_FILTERED
        threads: config["threads"]
        params:
                config["refSeqsFile"]
        shell:
                "bash ./Scripts/filter_genome_fasta.sh {input} {params} {output}"

rule extract_chroms_from_query:
        input:
                config["qryAssembly"]
        output:
                QRY_FILTERED
        threads: config["threads"]
        params:
                config["qrySeqsFile"]
        shell:
                "bash ./Scripts/filter_genome_fasta.sh {input} {params} {output}"
