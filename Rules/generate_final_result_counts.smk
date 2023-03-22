rule produce_cuteSV_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.filtered.ALL.vcf"),
		ssmDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.SSm.vcf.sorted"),
                smlDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.Sml.vcf.sorted"),
                medDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.Med.vcf.sorted"),
                lrgDEL=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DEL.Lrg.vcf.sorted"),

                ssmINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.SSm.vcf.sorted"),
                smlINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.Sml.vcf.sorted"),
                medINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.Med.vcf.sorted"),
                lrgINS=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INS.Lrg.vcf.sorted"),

                ssmDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.SSm.vcf.sorted"),
                smlDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.Sml.vcf.sorted"),
                medDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.Med.vcf.sorted"),
                lrgDUP=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.DUP.Lrg.vcf.sorted"),

                ssmINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.SSm.vcf.sorted"),
                smlINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.Sml.vcf.sorted"),
                medINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.Med.vcf.sorted"),
                lrgINV=str(config["svResultsFolder"] + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV.INV.Lrg.vcf.sorted")
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
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs}"

rule produce_sniffles_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.SSm.vcf.sorted"),
                smlDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.Sml.vcf.sorted"),
                medDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.Med.vcf.sorted"),
                lrgDEL=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DEL.Lrg.vcf.sorted"),

                ssmINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.SSm.vcf.sorted"),
                smlINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.Sml.vcf.sorted"),
                medINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.Med.vcf.sorted"),
                lrgINS=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INS.Lrg.vcf.sorted"),

                ssmDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.SSm.vcf.sorted"),
                smlDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.Sml.vcf.sorted"),
                medDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.Med.vcf.sorted"),
                lrgDUP=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.DUP.Lrg.vcf.sorted"),

                ssmINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.SSm.vcf.sorted"),
                smlINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.Sml.vcf.sorted"),
                medINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.Med.vcf.sorted"),
                lrgINV=str(config["svResultsFolder"] + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2.INV.Lrg.vcf.sorted")
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
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs}"

rule produce_svim_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.SSm.vcf.sorted"),
                smlDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.Sml.vcf.sorted"),
                medDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.Med.vcf.sorted"),
                lrgDEL=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DEL.Lrg.vcf.sorted"),

                ssmINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.SSm.vcf.sorted"),
                smlINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.Sml.vcf.sorted"),
                medINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.Med.vcf.sorted"),
                lrgINS=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INS.Lrg.vcf.sorted"),

                ssmDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.SSm.vcf.sorted"),
                smlDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.Sml.vcf.sorted"),
                medDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.Med.vcf.sorted"),
                lrgDUP=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.DUP.Lrg.vcf.sorted"),

                ssmINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.SSm.vcf.sorted"),
                smlINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.Sml.vcf.sorted"),
                medINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.Med.vcf.sorted"),
                lrgINV=str(config["svResultsFolder"] + "/SVIM/" + REF_SAMP_NAME + ".svim.INV.Lrg.vcf.sorted")
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
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs}"

rule produce_svim_asm_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.SSm.vcf.sorted"),
                smlDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.Sml.vcf.sorted"),
                medDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.Med.vcf.sorted"),
                lrgDEL=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DEL.Lrg.vcf.sorted"),

                ssmINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.SSm.vcf.sorted"),
                smlINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.Sml.vcf.sorted"),
                medINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.Med.vcf.sorted"),
                lrgINS=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INS.Lrg.vcf.sorted"),

                ssmDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.SSm.vcf.sorted"),
                smlDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.Sml.vcf.sorted"),
                medDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.Med.vcf.sorted"),
                lrgDUP=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.DUP.Lrg.vcf.sorted"),

                ssmINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.SSm.vcf.sorted"),
                smlINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.Sml.vcf.sorted"),
                medINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.Med.vcf.sorted"),
                lrgINV=str(config["svResultsFolder"] + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm.INV.Lrg.vcf.sorted")
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
                "bash ./Scripts/summarize_SV_counts.sh A BND {output} {input.allVCFs}"

rule produce_pav_sv_counts:
        input:
                allVCFs=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.filtered.ALL.vcf"),
                ssmDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.SSm.vcf.sorted"),
                smlDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.Sml.vcf.sorted"),
                medDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.Med.vcf.sorted"),
                lrgDEL=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.DEL.Lrg.vcf.sorted"),

                ssmINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.SSm.vcf.sorted"),
                smlINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.Sml.vcf.sorted"),
                medINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.Med.vcf.sorted"),
                lrgINS=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INS.Lrg.vcf.sorted"),

                ssmINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.SSm.vcf.sorted"),
                smlINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.Sml.vcf.sorted"),
                medINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.Med.vcf.sorted"),
                lrgINV=str(config["svResultsFolder"] + "/PAV/" + REF_SAMP_NAME + ".pav.INV.Lrg.vcf.sorted")
        output:
                str(TOTALS_DIR + "/PAV.summary")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/TotallingSVs.benchmarking.tsv"), BENCH_REPEAT)
        shell:
                "bash ./Scripts/summarize_SV_counts.sh W DEL {output} {input.allVCFs} {input.ssmDEL} {input.smlDEL} {input.medDEL} {input.lrgDEL};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INS {output} {input.allVCFs} {input.ssmINS} {input.smlINS} {input.medINS} {input.lrgINS};\n"
                "bash ./Scripts/summarize_SV_counts.sh A INV {output} {input.allVCFs} {input.ssmINV} {input.smlINV} {input.medINV} {input.lrgINV};\n"
