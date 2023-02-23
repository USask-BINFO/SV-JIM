rule build_bowtie2_index:
        input:
                str(FASTQC_OUTDIR+ "/" + SR_ACCESSION + "_1_fastqc.html"),
                str(FASTQC_OUTDIR + "/" + SR_ACCESSION + "_2_fastqc/" + "fastqc_report.html")
        output:
                str(REF_PREFIX + "_index.1.bt2"),
                str(REF_PREFIX + "_index.2.bt2"),
                str(REF_PREFIX + "_index.rev.1.bt2"),
                str(REF_PREFIX + "_index.rev.2.bt2")
        threads: config["threads"]
        params:
                refGenome=REF_FILTERED,
                refPrefix=REF_PREFIX
        conda:
                config["bowtie2CondaEnvYAML"]
        shell:
                "bowtie2-build {params.refGenome} {params.refPrefix}_index"

rule align_SR_w_bowtie2:
        input:
                str(REF_PREFIX + "_index.1.bt2"),
                str(REF_PREFIX + "_index.2.bt2"),
                str(REF_PREFIX + "_index.rev.1.bt2"),
                str(REF_PREFIX + "_index.rev.2.bt2")
        output:
                str(BT2_PREFIX + ".sam")
        threads: config["threads"]
        params:
                refPrefix=REF_PREFIX,
                srPrefix=SR_PREFIX
        conda:
                config["bowtie2CondaEnvYAML"]
        shell:
                "bowtie2 --threads {threads} -x {params.refPrefix}_index -1 {params.srPrefix}_1_Paired.fastq "
                "-2 {params.srPrefix}_2_Paired.fastq -q --no-discordant --very-sensitive --score-min L,-10,-0.1 -S {output}"
