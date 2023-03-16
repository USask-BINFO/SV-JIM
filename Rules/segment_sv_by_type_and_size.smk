rule segment_cuteSV_SVs:
        input:
                str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                #str(CUTESV_PREFIX + ".DEL.vcf"),
                #str(CUTESV_PREFIX + ".INS.vcf"),
                #str(CUTESV_PREFIX + ".DUP.vcf"),
                #str(CUTESV_PREFIX + ".INV.vcf"),
                str(CUTESV_PREFIX + ".BND.vcf"),
                str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                str(CUTESV_PREFIX + ".INV.Sml.vcf"),
                str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                str(CUTESV_PREFIX + ".INS.Med.vcf"),
                str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                str(CUTESV_PREFIX + ".INV.Med.vcf"),
                str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileSegmentation.benchmarking.tsv"), BENCH_REPEAT)
        params:
                CUTESV_PREFIX,
                "CuteSV"
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_sniffles2_SVs:
        input:
                str(SNIFFLES_PREFIX + ".filtered.ALL.vcf")
        output:
                #str(SNIFFLES_PREFIX + ".DEL.vcf"),
                #str(SNIFFLES_PREFIX + ".INS.vcf"),
                #str(SNIFFLES_PREFIX + ".DUP.vcf"),
                #str(SNIFFLES_PREFIX + ".INV.vcf"),
                str(SNIFFLES_PREFIX + ".BND.vcf"),
                str(SNIFFLES_PREFIX + ".DEL.SSm.vcf"),
                str(SNIFFLES_PREFIX + ".INS.SSm.vcf"),
                str(SNIFFLES_PREFIX + ".DUP.SSm.vcf"),
                str(SNIFFLES_PREFIX + ".INV.SSm.vcf"),
                str(SNIFFLES_PREFIX + ".DEL.Sml.vcf"),
                str(SNIFFLES_PREFIX + ".INS.Sml.vcf"),
                str(SNIFFLES_PREFIX + ".DUP.Sml.vcf"),
                str(SNIFFLES_PREFIX + ".INV.Sml.vcf"),
                str(SNIFFLES_PREFIX + ".DEL.Med.vcf"),
                str(SNIFFLES_PREFIX + ".INS.Med.vcf"),
                str(SNIFFLES_PREFIX + ".DUP.Med.vcf"),
                str(SNIFFLES_PREFIX + ".INV.Med.vcf"),
                str(SNIFFLES_PREFIX + ".DEL.Lrg.vcf"),
                str(SNIFFLES_PREFIX + ".INS.Lrg.vcf"),
                str(SNIFFLES_PREFIX + ".DUP.Lrg.vcf"),
                str(SNIFFLES_PREFIX + ".INV.Lrg.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileSegmentation.benchmarking.tsv"), BENCH_REPEAT)
        params:
                SNIFFLES_PREFIX,
                "Sniffles"
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_svim_SVs:
        input:
                str(SVIM_PREFIX + ".filtered.ALL.vcf")
        output:
                #str(SVIM_PREFIX + ".DEL.vcf"),
                #str(SVIM_PREFIX + ".INS.vcf"),
                #str(SVIM_PREFIX + ".DUP.vcf"),
                #str(SVIM_PREFIX + ".INV.vcf"),
                str(SVIM_PREFIX + ".BND.vcf"),
                str(SVIM_PREFIX + ".DEL.SSm.vcf"),
                str(SVIM_PREFIX + ".INS.SSm.vcf"),
                str(SVIM_PREFIX + ".DUP.SSm.vcf"),
                str(SVIM_PREFIX + ".INV.SSm.vcf"),
                str(SVIM_PREFIX + ".DEL.Sml.vcf"),
                str(SVIM_PREFIX + ".INS.Sml.vcf"),
                str(SVIM_PREFIX + ".DUP.Sml.vcf"),
                str(SVIM_PREFIX + ".INV.Sml.vcf"),
                str(SVIM_PREFIX + ".DEL.Med.vcf"),
                str(SVIM_PREFIX + ".INS.Med.vcf"),
                str(SVIM_PREFIX + ".DUP.Med.vcf"),
                str(SVIM_PREFIX + ".INV.Med.vcf"),
                str(SVIM_PREFIX + ".DEL.Lrg.vcf"),
                str(SVIM_PREFIX + ".INS.Lrg.vcf"),
                str(SVIM_PREFIX + ".DUP.Lrg.vcf"),
                str(SVIM_PREFIX + ".INV.Lrg.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileSegmentation.benchmarking.tsv"), BENCH_REPEAT)
        params:
                SVIM_PREFIX,
                "SVIM"
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_svim_asm_SVs:
        input:
                str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                #str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                #str(SVIM_ASM_PREFIX + ".INS.vcf"),
                #str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                #str(SVIM_ASM_PREFIX + ".INV.vcf"),
                str(SVIM_ASM_PREFIX + ".BND.vcf"),
                str(SVIM_ASM_PREFIX + ".DEL.SSm.vcf"),
                str(SVIM_ASM_PREFIX + ".INS.SSm.vcf"),
                str(SVIM_ASM_PREFIX + ".DUP.SSm.vcf"),
                str(SVIM_ASM_PREFIX + ".INV.SSm.vcf"),
                str(SVIM_ASM_PREFIX + ".DEL.Sml.vcf"),
                str(SVIM_ASM_PREFIX + ".INS.Sml.vcf"),
                str(SVIM_ASM_PREFIX + ".DUP.Sml.vcf"),
                str(SVIM_ASM_PREFIX + ".INV.Sml.vcf"),
                str(SVIM_ASM_PREFIX + ".DEL.Med.vcf"),
                str(SVIM_ASM_PREFIX + ".INS.Med.vcf"),
                str(SVIM_ASM_PREFIX + ".DUP.Med.vcf"),
                str(SVIM_ASM_PREFIX + ".INV.Med.vcf"),
                str(SVIM_ASM_PREFIX + ".DEL.Lrg.vcf"),
                str(SVIM_ASM_PREFIX + ".INS.Lrg.vcf"),
                str(SVIM_ASM_PREFIX + ".DUP.Lrg.vcf"),
                str(SVIM_ASM_PREFIX + ".INV.Lrg.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileSegmentation.benchmarking.tsv"), BENCH_REPEAT)
        params:
                SVIM_ASM_PREFIX,
                "SVIM-ASM"
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_pav_SVs:
        input:
                str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                #str(PAV_PREFIX + ".DEL.vcf"),
                #str(PAV_PREFIX + ".INS.vcf"),
                #str(PAV_PREFIX + ".INV.vcf"),
                str(PAV_PREFIX + ".DEL.SSm.vcf"),
                str(PAV_PREFIX + ".INS.SSm.vcf"),
                str(PAV_PREFIX + ".INV.SSm.vcf"),
                str(PAV_PREFIX + ".DEL.Sml.vcf"),
                str(PAV_PREFIX + ".INS.Sml.vcf"),
                str(PAV_PREFIX + ".INV.Sml.vcf"),
                str(PAV_PREFIX + ".DEL.Med.vcf"),
                str(PAV_PREFIX + ".INS.Med.vcf"),
                str(PAV_PREFIX + ".INV.Med.vcf"),
                str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                str(PAV_PREFIX + ".INS.Lrg.vcf"),
                str(PAV_PREFIX + ".INV.Lrg.vcf")
        threads: 1 #config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/FileSegmentation.benchmarking.tsv"), BENCH_REPEAT)
        params:
                PAV_PREFIX
        shell:
                "bash ./Scripts/segment_pav_w_bcftools.sh {input} {params}"
