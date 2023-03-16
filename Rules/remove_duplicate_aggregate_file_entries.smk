rule remove_dups_cuteSV_aggregates:
        input:
                minTwo=str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minTwo.sorted.vcf"),
                minThree=str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minThree.sorted.vcf"),
                minFour=str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minFour.sorted.vcf"),
        output:
                uniqueTwo=str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minTwo.unique.sorted.vcf"),
                uniqueThree=str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minThree.unique.sorted.vcf"),
                uniqueFour=str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minFour.unique.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Aggregation.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "uniq {input.minTwo} > {output.uniqueTwo};\n"
                "uniq {input.minThree} > {output.uniqueThree};\n"
                "uniq {input.minFour} > {output.uniqueFour}"
 
rule remove_dups_pav_aggregates:
        input:
                minTwo=str(config["aggregatedResultsFolder"] + "/PAV/tp.minTwo.sorted.vcf"),
                minThree=str(config["aggregatedResultsFolder"] + "/PAV/tp.minThree.sorted.vcf"),
                minFour=str(config["aggregatedResultsFolder"] + "/PAV/tp.minFour.sorted.vcf"),
        output:
                uniqueTwo=str(config["aggregatedResultsFolder"] + "/PAV/tp.minTwo.unique.sorted.vcf"),
                uniqueThree=str(config["aggregatedResultsFolder"] + "/PAV/tp.minThree.unique.sorted.vcf"),
                uniqueFour=str(config["aggregatedResultsFolder"] + "/PAV/tp.minFour.unique.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Aggregation.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "uniq {input.minTwo} > {output.uniqueTwo};\n"
                "uniq {input.minThree} > {output.uniqueThree};\n"
                "uniq {input.minFour} > {output.uniqueFour}"

rule remove_dups_sniffles_aggregates:
        input:
                minTwo=str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minTwo.sorted.vcf"),
                minThree=str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minThree.sorted.vcf"),
                minFour=str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minFour.sorted.vcf"),
        output:
                uniqueTwo=str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minTwo.unique.sorted.vcf"),
                uniqueThree=str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minThree.unique.sorted.vcf"),
                uniqueFour=str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minFour.unique.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Aggregation.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "uniq {input.minTwo} > {output.uniqueTwo};\n"
                "uniq {input.minThree} > {output.uniqueThree};\n"
                "uniq {input.minFour} > {output.uniqueFour}"

rule remove_dups_svim_aggregates:
        input:
                minTwo=str(config["aggregatedResultsFolder"] + "/SVIM/tp.minTwo.sorted.vcf"),
                minThree=str(config["aggregatedResultsFolder"] + "/SVIM/tp.minThree.sorted.vcf"),
                minFour=str(config["aggregatedResultsFolder"] + "/SVIM/tp.minFour.sorted.vcf"),
        output:
                uniqueTwo=str(config["aggregatedResultsFolder"] + "/SVIM/tp.minTwo.unique.sorted.vcf"),
                uniqueThree=str(config["aggregatedResultsFolder"] + "/SVIM/tp.minThree.unique.sorted.vcf"),
                uniqueFour=str(config["aggregatedResultsFolder"] + "/SVIM/tp.minFour.unique.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Aggregation.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "uniq {input.minTwo} > {output.uniqueTwo};\n"
                "uniq {input.minThree} > {output.uniqueThree};\n"
                "uniq {input.minFour} > {output.uniqueFour}"

rule remove_dups_svim_asm_aggregates:
        input:
                minTwo=str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minTwo.sorted.vcf"),
                minThree=str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minThree.sorted.vcf"),
                minFour=str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minFour.sorted.vcf"),
        output:
                uniqueTwo=str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minTwo.unique.sorted.vcf"),
                uniqueThree=str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minThree.unique.sorted.vcf"),
                uniqueFour=str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minFour.unique.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Aggregation.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "uniq {input.minTwo} > {output.uniqueTwo};\n"
                "uniq {input.minThree} > {output.uniqueThree};\n"
                "uniq {input.minFour} > {output.uniqueFour}"
