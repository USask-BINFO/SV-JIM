rule prefetch_SR_reads:
        output:
                str(SR_PREFIX + ".sra")
        params:
                maxFileSize=config["prefetchMaxSize"],
                srPrefix=SR_PREFIX
        shell:
                "prefetch --maxsize {params.maxFileSize} -O {params.srPrefix}"

rule prefetch_LR_reads:
        output:
                str(LR_PREFIX + ".sra")
        params:
                maxFileSize=config["prefetchMaxSize"],
                lrPrefix=LR_PREFIX
        shell:
                "prefetch --maxsize {params.maxFileSize} -O {params.lrPrefix}"
