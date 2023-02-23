rule SR_align_QA_w_Qualimap:
        input:
                sortedFile=str(SR_ALIGNER_PREFIX + ".sorted.bam"),
                indexFile=str(SR_ALIGNER_PREFIX + ".sorted.bam.bai")
        output:
                str(QUALIMAP_OUTDIR + "/report.pdf") # update once you know real default name
        threads: NUM_THREADS
        params:
                qualimapOutDir=QUALIMAP_OUTDIR
        shell:
                "qualimap bamqc -bam {input.sortedFile} -outdir {params.qualimapOutDir} -outformat PDF --java-mem-size=8G"
