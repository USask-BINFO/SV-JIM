rule prefetch_LR_reads:
        output:
                str(LR_PREFIX + ".sra")
        params:
                maxFileSize=config["prefetchMaxSize"],
                lrPrefix=LR_PREFIX
        shell:
                "prefetch --maxsize {params.maxFileSize} -O {params.lrPrefix}"

rule reformat_LR_sra_to_fastq:
        input:
                str(LR_PREFIX + ".sra")
        output:
                str(LR_PREFIX + "/" + LR_ACCESSION + ".fastq")
        threads: config["threads"]
        params:
                config["longReadsFolder"]
        shell:
                "fasterq-dump -O {params} {input}"
