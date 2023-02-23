rule perform_read_QA_Strand_One:
        input:
                str(SR_PREFIX + "_1.fastq")
        output:
                str(FASTQC_OUTDIR + "/" + SR_ACCESSION + "_1_fastqc.html")
        threads: NUM_THREADS
        params:
                FASTQC_OUTDIR
        shell:
                "fastqc -t {threads} {input} -o {params}"

rule perform_read_QA_Strand_Two:
        input:
                str(SR_PREFIX + "_2.fastq")
        output:
                str(FASTQC_OUTDIR + "/" + SR_ACCESSION + "_2_fastqc/" + "fastqc_report.html")
        threads: NUM_THREADS
        params:
                FASTQC_OUTDIR
        shell:
                "fastqc -t {threads} {input} -o {params}"
