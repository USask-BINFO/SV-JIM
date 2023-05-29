rule sort_LR_bam_file:
        input:
                str(MNMP2_READS_PREFIX + ".sam")
        output:
                str(MNMP2_READS_PREFIX + ".sorted.bam")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["memSettingForAssemblySort"]
        shell:
                "samtools sort -m{params} -@ {threads} -o {output} {input}"

rule index_sorted_LR_bam_file:
        input:
                str(MNMP2_READS_PREFIX + ".sorted.bam")
        output:
                str(MNMP2_READS_PREFIX + ".sorted.bam.bai")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools index -@ {threads} {input}"

rule sort_genomes_bam_file:
        input:
                str(MNMP2_GENOMES_PREFIX + ".sam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".sorted.bam")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                config["memSettingForAssemblySort"]
        shell:
                "samtools sort -m{params} -@ {threads} -o {output} {input}"

rule index_sorted_genomes_bam_file:
        input:
                str(MNMP2_GENOMES_PREFIX + ".sorted.bam")
        output:
                str(MNMP2_GENOMES_PREFIX + ".sorted.bam.bai")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "samtools index -@ {threads} {input}"
