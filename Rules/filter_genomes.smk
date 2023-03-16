rule extract_chroms_from_reference:
        input:
                config["refAssembly"]
        output:
                REF_FILTERED
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                seqNames=config["refSeqsFile"],
                genomesDir=GENOME_DIR
        shell:
                "mkdir -p {params.genomesDir};\n"
                "bash ./Scripts/filter_genome_fasta.sh {input} {params.seqNames} {output}"

rule extract_chroms_from_query:
        input:
                config["qryAssembly"]
        output:
                QRY_FILTERED
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                seqNames=config["qrySeqsFile"],
                genomesDir=GENOME_DIR
        shell:
                "mkdir -p {params.genomesDir};\n"
                "bash ./Scripts/filter_genome_fasta.sh {input} {params.seqNames} {output}"
