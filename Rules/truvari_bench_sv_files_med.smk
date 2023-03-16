rule truvari_bench_sniffles_w_svim_Med:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Med.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Med.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Med.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Med.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.Med.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Med.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Med.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.txt"),
                sniffSVIMDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-call.vcf"),
                sniffSVIMINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-call.vcf"),
                sniffSVIMDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/tp-call.vcf"),
                sniffSVIMINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-call.vcf"),
                sniffSVIMDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-base.vcf"),
                sniffSVIMINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-base.vcf"),
                sniffSVIMDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/tp-base.vcf"),
                sniffSVIMINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="Sniffles-SVIM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.snifflesDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_w_sniffles_Med:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Med.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Med.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Med.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Med.vcf"),
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/summary.txt"),
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-Sniffles"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.snifflesDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_w_svi_Med:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Med.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.Med.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Med.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Med.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Med/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Med/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Med/tp-call.vcf"),
                tpDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Med/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Med/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-SVIM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_w_svim_asm_Med:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Med.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Med.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Med.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Med.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-SVIM-ASM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteSVINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_sniffles_w_svim_asm_Med:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Med.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Med.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Med.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Med.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Med.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Med.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Med.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.snifflesDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.snifflesINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_svim_w_svim_asm_Med:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.Med.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Med.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Med.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Med.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Med.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Med.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Med.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.svimDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.svimINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_w_pav_Med:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Med.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.pavDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.pavINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.pavINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_sniffles_Med:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Med.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Med.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Med.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-Sniffles"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_svim_Med:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.Med.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Med.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Med.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-SVIM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_svim_asm_Med:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Med.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Med.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Med.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-SVIM-ASM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.pavINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_sniffles_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall/summary.txt"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPBase/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPBase/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-Sniffles-SVIM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_pav_svim_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPBase/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-SVIM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_sniffles_svim_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPBase/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-Sniffles-SVIM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_svim_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPBase/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-SVIM-SVIM-ASM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_sniffles_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPBase/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-Sniffles",
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPBase/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-SVIM-ASM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_sniffles_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Med.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPBase/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-Sniffles-SVIM-ASM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_svim_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPBase/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-SVIM-SVIM-ASM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_sniffles_svim_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneDEL=str(SNIFFLES_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(SNIFFLES_PREFIX + ".INS.Med.vcf"),
                setOneDUP=str(SNIFFLES_PREFIX + ".DUP.Med.vcf"),
                setOneINV=str(SNIFFLES_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPBase/tp-base.vcf"),
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="Sniffles-SVIM-SVIM-ASM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_sniffles_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Med.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Med.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPBase/tp-base.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-Sniffles-SVIM-ASM",
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_sniffles_svim_svim_asm_Med:
        input:
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/tp-base.vcf"),
                cuteSniffDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/summary.txt"),
                cuteSniffINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/summary.txt"),
                cuteSniffDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/summary.txt"),
                cuteSniffINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
                svimSVIMASMDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                svimSVIMASMINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                svimSVIMASMDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.txt"),
                svimSVIMASMINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                callTPCalLDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-Sniffles-SVIM-SVIM-ASM",
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med"),
                setOneDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_quads.sh {params.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_pav_sniffles_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Base/FromTPCall/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-Sniffles-SVIM-ASM",
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_sniffles_svim_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Base/FromTPCall/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-Sniffles-SVIM",
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_svim_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-SVIM-SVIM-ASM",
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_sniffles_svim_svim_asm_Med:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="PAV-Sniffles-SVIM-SVIM-ASM",
                setOneDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med"),
                setOneINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med"),
                setOneINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_sniffles_svim_svim_asm_Med:
        input:
                notCuteDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                notCuteINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                notCuteINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                notCuteDELTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/tp-call.vcf"),
                notCuteINSTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/tp-call.vcf"),
                notCuteINVTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/tp-call.vcf"),
                cuteDEL=str(CUTESV_PREFIX + ".DEL.Med.vcf"),
                cuteINS=str(CUTESV_PREFIX + ".INS.Med.vcf"),
                cuteINV=str(CUTESV_PREFIX + ".INV.Med.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/tp-call.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Truvari.benchmarking.tsv"), BENCH_REPEAT)
        params:
                refGenome=REF_FILTERED,
                minOverlap=config["overlapThreshold"],
                maxRefDist=config["maxRefDistance"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                truvariDir=config["truvariResultsFolder"],
                toolsPrefix="CuteSV-PAV-Sniffles-SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteDEL} {input.notCuteDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteINS} {input.notCuteINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteINV} {input.notCuteINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"
