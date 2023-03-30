rule prefetch_LR_reads:
        input:
                config["readFilesList"]
        output:
                prefetchConfirm=str(LR_PREFIX + ".sra")
        benchmark:
                repeat(str(BENCH_DIR + "/Prefetch.benchmarking.tsv"), BENCH_REPEAT)
        params:
                maxFileSize=config["prefetchMaxSize"],
                #lrAccession=config["firstLRAccession"],
                readsOutDir=config["longReadsFolder"]
        shell:
                "bash Scripts/prefetch_read_files_list.sh {params.readsOutDir} {params.maxFileSize} {input}"
                #"mkdir -p {params.readsOutDir};\n"
                #"prefetch --max-size {params.maxFileSize} -o {output} {params.lrAccession}"

rule reformat_LR_sra_to_fastq:
        input:
                prefetchConfirm=str(LR_PREFIX + ".sra"),
                readFilesList=config["readFilesList"]
        output:
                reformatConfirm=str(LR_PREFIX + ".fastq")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Prefetch.benchmarking.tsv"), BENCH_REPEAT)
        params:
                maxFileSize=config["prefetchMaxSize"],
                readsOutDir=config["longReadsFolder"]
        shell:
                "bash ./Scripts/fasterq_dump_read_files.sh {threads} {params.readsOutDir} {input.readFilesList} {params.maxFileSize}"
                #"mkdir -p {params};\n"
                #"fasterq-dump --threads {threads} -O {params} {input}"
