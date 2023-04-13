rule truvari_bench_sniffles_w_svim_Lrg:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Lrg.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Lrg.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Lrg.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Lrg.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.Lrg.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Lrg.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Lrg.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.txt"),
                sniffSVIMDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-call.vcf"),
                sniffSVIMINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-call.vcf"),
                sniffSVIMDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/tp-call.vcf"),
                sniffSVIMINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-call.vcf"),
                sniffSVIMDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-base.vcf"),
                sniffSVIMINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-base.vcf"),
                sniffSVIMDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/tp-base.vcf"),
                sniffSVIMINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.snifflesDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_w_sniffles_Lrg:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Lrg.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Lrg.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Lrg.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Lrg.vcf"),
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/summary.txt"),
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.snifflesDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_w_svim_Lrg:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.Lrg.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Lrg.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Lrg.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Lrg/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Lrg/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Lrg/tp-call.vcf"),
                tpDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Lrg/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Lrg/tp-call.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_w_svim_asm_Lrg:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Lrg.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Lrg.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Lrg.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg/tp-base.vcf"),
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteSVINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_sniffles_w_svim_asm_Lrg:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Lrg.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Lrg.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.Lrg.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Lrg.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Lrg.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Lrg.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Lrg.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.snifflesDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.snifflesINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_svim_w_svim_asm_Lrg:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.Lrg.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Lrg.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.Lrg.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Lrg.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Lrg.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Lrg.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.Lrg.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.svimDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.svimINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_w_pav_Lrg:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.pavDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.pavINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.pavINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_w_sniffles_Lrg:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.Lrg.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.Lrg.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.Lrg.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_w_svim_Lrg:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.Lrg.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.Lrg.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.Lrg.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_w_svim_asm_Lrg:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.Lrg.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.Lrg.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.Lrg.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/tp-base.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.pavINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_sniffles_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.txt"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPBase/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_pav_svim_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_sniffles_svim_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_svim_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_pav_sniffles_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_pav_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_sniffles_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.Lrg.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_svim_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_sniffles_svim_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(SNIFFLES_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(SNIFFLES_PREFIX + ".INS.Lrg.vcf"),
                setOneDUP=str(SNIFFLES_PREFIX + ".DUP.Lrg.vcf"),
                setOneINV=str(SNIFFLES_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_sniffles_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.Lrg.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg"),
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_sniffles_svim_svim_asm_Lrg:
        input:
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/tp-base.vcf"),
                cuteSniffDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/summary.txt"),
                cuteSniffINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/summary.txt"),
                cuteSniffDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/summary.txt"),
                cuteSniffINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                svimSVIMASMDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                svimSVIMASMINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                svimSVIMASMDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.txt"),
                svimSVIMASMINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                callTPCalLDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg"),
                setOneDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_quads.sh {params.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg;\n"

rule truvari_bench_cuteSV_pav_sniffles_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_pav_sniffles_svim_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_pav_svim_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_pav_sniffles_svim_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg"),
                setOneINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg"),
                setOneINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"

rule truvari_bench_cuteSV_pav_sniffles_svim_svim_asm_Lrg:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/tp-base.vcf")

                #notCuteDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                #notCuteINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                #notCuteINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                #notCuteDELTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                #notCuteINSTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                #notCuteINVTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                #cuteDEL=str(CUTESV_PREFIX + ".DEL.Lrg.vcf"),
                #cuteINS=str(CUTESV_PREFIX + ".INS.Lrg.vcf"),
                #cuteINV=str(CUTESV_PREFIX + ".INV.Lrg.vcf"),
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/tp-call.vcf")

                #summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                #summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                #summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/summary.txt"),
                #tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/tp-call.vcf"),
                #tpINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/tp-call.vcf"),
                #tpINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/tp-call.vcf")
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
                toolsPrefix="CuteSV-PAV-Sniffles-SVIM-SVIM-ASM",
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_all.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/Lrg;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_all.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/Lrg;\n"
                "bash ./Scripts/compare_breakends_w_truvari_all.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/Lrg"
