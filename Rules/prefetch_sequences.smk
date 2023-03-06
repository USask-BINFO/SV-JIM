rule prefetch_LR_reads:
        output:
                str(LR_PREFIX + ".sra")
        params:
                maxFileSize=config["prefetchMaxSize"],
                lrAccession=config["accessionLR"]
        shell:
                "prefetch --max-size {params.maxFileSize} -o {output} {params.lrAccession}"

rule reformat_LR_sra_to_fastq:
        input:
                str(LR_PREFIX + ".sra")
        output:
                str(LR_PREFIX + ".fastq")
        threads: config["threads"]
        params:
                config["longReadsFolder"]
        shell:
                "fasterq-dump --threads {threads} -O {params} {input}"
