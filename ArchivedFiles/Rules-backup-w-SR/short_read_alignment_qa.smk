rule SR_align_QA_w_Qualimap:
        input:
                sortedFile=str(SR_ALIGNER_PREFIX + ".sorted.bam"),
                indexFile=str(SR_ALIGNER_PREFIX + ".sorted.bam.bai")
        output:
                str(config["qualimapReportsFolder"] + "/report.pdf") # update once you know real default name
        threads: config["threads"]
        params:
                config["qualimapReportsFolder"]
        shell:
                "qualimap bamqc -bam {input.sortedFile} -outdir {params} -outformat PDF --java-mem-size=8G"
