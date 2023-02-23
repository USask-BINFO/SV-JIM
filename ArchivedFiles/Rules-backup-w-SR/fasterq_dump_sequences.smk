rule reformat_SR_sra_to_fastq:
        input:
                str(SR_PREFIX + ".sra")
        output:
                str(SR_PREFIX + "_1.fastq"),
                str(SR_PREFIX + "_2.fastq")
        threads: config["threads"]
        params:
                config["shortReadsFolder"]
        shell:
                "fasterq-dump -O {params} --split-files {input}"

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
