rule build_bwa_fm_index:
        input:
                str(FASTQC_OUTDIR+ "/" + SR_ACCESSION + "_1_fastqc.html"),
                str(FASTQC_OUTDIR + "/" + SR_ACCESSION + "_2_fastqc/" + "fastqc_report.html")
        output:
                str(REF_GENOME + ".amb"),
                str(REF_GENOME + ".ann"),
                str(REF_GENOME + ".bwt"),
                str(REF_GENOME + ".pac"),
                str(REF_GENOME + ".sa")
        params:
                refGenome=REF_GENOME
        shell:
                "bwa index {params.refGenome}"

rule align_SR_w_bwa_mem:
        input:
                indexAMB=str(REF_GENOME + ".amb"),
                indexANN=str(REF_GENOME + ".ann"),
                indexBWT=str(REF_GENOME + ".bwt"),
                indexPAC=str(REF_GENOME + ".pac"),
                indexSA=str(REF_GENOME + ".sa")
        output:
                str(BWA_PREFIX + ".sam")
        threads: NUM_THREADS
        params:
                refGenome=REF_GENOME,
                srPrefix=SR_PREFIX
        shell:
                "bwa mem -t {threads} {params.refGenome} {params.srPrefix}_1_Paired.fastq {params.srPrefix}_2_Paired.fastq > {output}"
