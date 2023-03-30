rule produce_cuteSV_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.filtered.ALL.vcf"),
		ssmDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.SSm.vcf"),
                smlDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.Sml.vcf"),
                medDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.Med.vcf"),
                lrgDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.Lrg.vcf"),

                ssmINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.SSm.vcf"),
                smlINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.Sml.vcf"),
                medINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.Med.vcf"),
                lrgINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.Lrg.vcf"),

                ssmDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.SSm.vcf"),
                smlDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.Sml.vcf"),
                medDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.Med.vcf"),
                lrgDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.Lrg.vcf"),

                ssmINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.SSm.vcf"),
                smlINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.Sml.vcf"),
                medINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.Med.vcf"),
                lrgINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.Lrg.vcf")
        output:
                str(TOTALS_DIR + "/CuteSV.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/summarize_SV_counts.sh W DEL {output} {input.allVCFs} {input.ssmDEL} {input.smlDEL} {input.medDEL} {input.lrgDEL};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INS {output} {input.allVCFs} {input.ssmINS} {input.smlINS} {input.medINS} {input.lrgINS};\n"
                "bash ./Scripts/summarize_SV_counts.sh A DUP {output} {input.allVCFs} {input.ssmDUP} {input.smlDUP} {input.medDUP} {input.lrgDUP};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INV {output} {input.allVCFs} {input.ssmINV} {input.smlINV} {input.medINV} {input.lrgINV};\n"
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs};\n"
                "bash ./Scripts/total_SV_counts.sh {output}"

rule produce_sniffles_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.SSm.vcf"),
                smlDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.Sml.vcf"),
                medDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.Med.vcf"),
                lrgDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.Lrg.vcf"),

                ssmINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.SSm.vcf"),
                smlINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.Sml.vcf"),
                medINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.Med.vcf"),
                lrgINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.Lrg.vcf"),

                ssmDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.SSm.vcf"),
                smlDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.Sml.vcf"),
                medDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.Med.vcf"),
                lrgDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.Lrg.vcf"),

                ssmINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.SSm.vcf"),
                smlINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.Sml.vcf"),
                medINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.Med.vcf"),
                lrgINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.Lrg.vcf")
        output:
                str(TOTALS_DIR + "/Sniffles.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/summarize_SV_counts.sh W DEL {output} {input.allVCFs} {input.ssmDEL} {input.smlDEL} {input.medDEL} {input.lrgDEL};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INS {output} {input.allVCFs} {input.ssmINS} {input.smlINS} {input.medINS} {input.lrgINS};\n"
                "bash ./Scripts/summarize_SV_counts.sh A DUP {output} {input.allVCFs} {input.ssmDUP} {input.smlDUP} {input.medDUP} {input.lrgDUP};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INV {output} {input.allVCFs} {input.ssmINV} {input.smlINV} {input.medINV} {input.lrgINV};\n"
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs};\n"
                "bash ./Scripts/total_SV_counts.sh {output}"

rule produce_svim_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.SSm.vcf"),
                smlDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.Sml.vcf"),
                medDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.Med.vcf"),
                lrgDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.Lrg.vcf"),

                ssmINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.SSm.vcf"),
                smlINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.Sml.vcf"),
                medINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.Med.vcf"),
                lrgINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.Lrg.vcf"),

                ssmDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.SSm.vcf"),
                smlDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.Sml.vcf"),
                medDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.Med.vcf"),
                lrgDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.Lrg.vcf"),

                ssmINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.SSm.vcf"),
                smlINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.Sml.vcf"),
                medINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.Med.vcf"),
                lrgINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.Lrg.vcf")
        output:
                str(TOTALS_DIR + "/SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/summarize_SV_counts.sh W DEL {output} {input.allVCFs} {input.ssmDEL} {input.smlDEL} {input.medDEL} {input.lrgDEL};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INS {output} {input.allVCFs} {input.ssmINS} {input.smlINS} {input.medINS} {input.lrgINS};\n"
                "bash ./Scripts/summarize_SV_counts.sh A DUP {output} {input.allVCFs} {input.ssmDUP} {input.smlDUP} {input.medDUP} {input.lrgDUP};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INV {output} {input.allVCFs} {input.ssmINV} {input.smlINV} {input.medINV} {input.lrgINV};\n"
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs};\n"
                "bash ./Scripts/total_SV_counts.sh {output}"

rule produce_svim_asm_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.SSm.vcf"),
                smlDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.Sml.vcf"),
                medDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.Med.vcf"),
                lrgDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.Lrg.vcf"),

                ssmINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.SSm.vcf"),
                smlINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.Sml.vcf"),
                medINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.Med.vcf"),
                lrgINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.Lrg.vcf"),

                ssmDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.SSm.vcf"),
                smlDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.Sml.vcf"),
                medDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.Med.vcf"),
                lrgDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.Lrg.vcf"),

                ssmINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.SSm.vcf"),
                smlINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.Sml.vcf"),
                medINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.Med.vcf"),
                lrgINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.Lrg.vcf")
        output:
                str(TOTALS_DIR + "/SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/summarize_SV_counts.sh W DEL {output} {input.allVCFs} {input.ssmDEL} {input.smlDEL} {input.medDEL} {input.lrgDEL};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INS {output} {input.allVCFs} {input.ssmINS} {input.smlINS} {input.medINS} {input.lrgINS};\n"
                "bash ./Scripts/summarize_SV_counts.sh A DUP {output} {input.allVCFs} {input.ssmDUP} {input.smlDUP} {input.medDUP} {input.lrgDUP};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INV {output} {input.allVCFs} {input.ssmINV} {input.smlINV} {input.medINV} {input.lrgINV};\n"
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs};\n"
                "bash ./Scripts/total_SV_counts.sh {output}"

rule produce_pav_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.SSm.vcf"),
                smlDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.Sml.vcf"),
                medDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.Med.vcf"),
                lrgDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.Lrg.vcf"),

                ssmINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.SSm.vcf"),
                smlINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.Sml.vcf"),
                medINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.Med.vcf"),
                lrgINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.Lrg.vcf"),

                ssmINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.SSm.vcf"),
                smlINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.Sml.vcf"),
                medINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.Med.vcf"),
                lrgINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.Lrg.vcf")
        output:
                str(TOTALS_DIR + "/PAV.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/summarize_SV_counts.sh W DEL {output} {input.allVCFs} {input.ssmDEL} {input.smlDEL} {input.medDEL} {input.lrgDEL};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INS {output} {input.allVCFs} {input.ssmINS} {input.smlINS} {input.medINS} {input.lrgINS};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INV {output} {input.allVCFs} {input.ssmINV} {input.smlINV} {input.medINV} {input.lrgINV};\n"
                "bash ./Scripts/total_SV_counts.sh {output}"

rule produce_cutesv_pav_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_sniffles_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-Sniffles.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_cutesv_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_cutesv_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_pav_sniffles_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-Sniffles.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_pav_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_pav_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_sniffles_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/Sniffles-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_sniffles_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/Sniffles-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_sniffles_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_sniffles_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-Sniffles-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_cutesv_sniffles_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-Sniffles-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_cutesv_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_pav_sniffles_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-Sniffles-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_pav_sniffles_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-Sniffles-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_pav_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_sniffles_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/Sniffles-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_sniffles_svim_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles-SVIM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_sniffles_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_sniffles_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-Sniffles-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_no_pav_counts.sh {output} {input}"

rule produce_pav_sniffles_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/PAV-Sniffles-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"

rule produce_cutesv_pav_sniffles_svim_svim_asm_summary_counts:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/Sml.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        output:
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/total_intersection_with_pav_counts.sh {output} {input}"
