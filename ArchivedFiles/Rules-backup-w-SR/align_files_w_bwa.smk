rule build_bwa_fm_index:
        input:
                str(FASTQC_OUTDIR+ "/" + SR_ACCESSION + "_1_fastqc.html"),
                str(FASTQC_OUTDIR + "/" + SR_ACCESSION + "_2_fastqc/" + "fastqc_report.html")
        output:
                str(REF_FILTERED + ".amb"),
                str(REF_FILTERED + ".ann"),
                str(REF_FILTERED + ".bwt"),
                str(REF_FILTERED + ".pac"),
                str(REF_FILTERED + ".sa")
        params:
                refGenome=REF_FILTERED
        shell:
                "bwa index {params.refGenome}"

rule align_SR_w_bwa_mem:
        input:
                indexAMB=str(REF_FILTERED + ".amb"),
                indexANN=str(REF_FILTERED + ".ann"),
                indexBWT=str(REF_FILTERED + ".bwt"),
                indexPAC=str(REF_FILTERED + ".pac"),
                indexSA=str(REF_FILTERED + ".sa")
        output:
                str(BWA_PREFIX + ".sam")
        threads: config["threads"]
        params:
                refGenome=REF_FILTERED,
                srPrefix=SR_PREFIX
        shell:
                "bwa mem -t {threads} {params.refGenome} {params.srPrefix}_1_Paired.fastq {params.srPrefix}_2_Paired.fastq > {output}"
