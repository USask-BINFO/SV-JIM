rule preprocess_SR_trimmo:
        input:
                str(SR_PREFIX + "_1.fastq"),
                str(SR_PREFIX + "_2.fastq")
        output:
                str(SR_PREFIX + "_1_Paired.fastq"),
                str(SR_PREFIX + "_1_Unpaired.fastq"),
                str(SR_PREFIX + "_2_Paired.fastq"),
                str(SR_PREFIX + "_2_Unpaired.fastq")
        threads: config["threads"]
        shell:
                "java -jar $TRIMMO/trimmomatic-0.39.jar PE {input} {output} "
                "ILLUMINACLIP:$TRIMMO/adapters/TruSeq3-PE.fa:2:30:10 "
                "LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50"
