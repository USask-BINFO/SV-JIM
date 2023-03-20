rule truvari_bench_sniffles_w_svim_Sml:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Sml.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Sml.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Sml.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Sml.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.Sml.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Sml.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Sml.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/summary.txt"),
                sniffSVIMDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-call.vcf"),
                sniffSVIMINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-call.vcf"),
                sniffSVIMDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/tp-call.vcf"),
                sniffSVIMINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-call.vcf"),
                sniffSVIMDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-base.vcf"),
                sniffSVIMINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-base.vcf"),
                sniffSVIMDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/tp-base.vcf"),
                sniffSVIMINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-base.vcf")
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

rule truvari_bench_cuteSV_w_sniffles_Sml:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Sml.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Sml.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Sml.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Sml.vcf"),
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/summary.txt"),
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/tp-base.vcf")
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

rule truvari_bench_cuteSV_w_svim_Sml:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Sml.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.Sml.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Sml.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Sml.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Sml/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Sml/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Sml/tp-call.vcf"),
                tpDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Sml/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Sml/tp-call.vcf")
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

rule truvari_bench_cuteSV_w_svim_asm_Sml:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Sml.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Sml.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Sml.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Sml.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Sml/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Sml/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Sml/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Sml/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Sml/tp-base.vcf"),
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

rule truvari_bench_sniffles_w_svim_asm_Sml:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Sml.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Sml.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Sml.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Sml.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Sml.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Sml.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Sml.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-base.vcf")
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

rule truvari_bench_svim_w_svim_asm_Sml:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.Sml.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Sml.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Sml.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Sml.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Sml.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Sml.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Sml.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
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

rule truvari_bench_cuteSV_w_pav_Sml:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Sml.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-base.vcf")
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

rule truvari_bench_pav_w_sniffles_Sml:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Sml.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Sml.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Sml.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/tp-base.vcf")
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

rule truvari_bench_pav_w_svim_Sml:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.Sml.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Sml.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Sml.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/tp-base.vcf")
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

rule truvari_bench_pav_w_svim_asm_Sml:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Sml.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Sml.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Sml.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/tp-base.vcf")
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

rule truvari_bench_cuteSV_sniffles_svim_Sml:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPCall/summary.txt"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPBase/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_pav_svim_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_sniffles_svim_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_svim_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_sniffles_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_sniffles_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Sml.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_svim_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_sniffles_svim_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(SNIFFLES_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(SNIFFLES_PREFIX + ".INS.Sml.vcf"),
                setOneDUP=str(SNIFFLES_PREFIX + ".DUP.Sml.vcf"),
                setOneINV=str(SNIFFLES_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_sniffles_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Sml.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Sml.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_sniffles_svim_svim_asm_Sml:
        input:
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/tp-base.vcf"),
                cuteSniffDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/summary.txt"),
                cuteSniffINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/summary.txt"),
                cuteSniffDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/summary.txt"),
                cuteSniffINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
                svimSVIMASMDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                svimSVIMASMINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                svimSVIMASMDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/summary.txt"),
                svimSVIMASMINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                callTPCalLDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml"),
                setOneDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_quads.sh {params.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"

rule truvari_bench_cuteSV_pav_sniffles_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_sniffles_svim_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_svim_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_sniffles_svim_svim_asm_Sml:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml"),
                setOneINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml"),
                setOneINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_pav_sniffles_svim_svim_asm_Sml:
        input:
                notCuteDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                notCuteINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                notCuteINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                notCuteDELTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/tp-call.vcf"),
                notCuteINSTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/tp-call.vcf"),
                notCuteINVTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/tp-call.vcf"),
                cuteDEL=str(CUTESV_PREFIX + ".DEL.Sml.vcf"),
                cuteINS=str(CUTESV_PREFIX + ".INS.Sml.vcf"),
                cuteINV=str(CUTESV_PREFIX + ".INV.Sml.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/tp-call.vcf")
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
