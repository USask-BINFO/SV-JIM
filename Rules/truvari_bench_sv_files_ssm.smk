rule truvari_bench_sniffles_w_svim_SSm:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.SSm.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.SSm.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.SSm.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.SSm.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.SSm.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.SSm.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.SSm.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.SSm.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt"),
                sniffSVIMDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-call.vcf"),
                sniffSVIMINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-call.vcf"),
                sniffSVIMDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/tp-call.vcf"),
                sniffSVIMINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-call.vcf"),
                sniffSVIMBNDTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/tp-call.vcf"),
                sniffSVIMDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-base.vcf"),
                sniffSVIMINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-base.vcf"),
                sniffSVIMDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/tp-base.vcf"),
                sniffSVIMINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-base.vcf"),
                sniffSVIMBNDTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.snifflesDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.snifflesBND} {input.svimBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_w_sniffles_SSm:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.SSm.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.SSm.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.SSm.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.SSm.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf")
        output:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt"),
                #sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/tp-call.vcf"),
                cuteSniffBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/tp-base.vcf"),
                cuteSniffBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.snifflesDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteSVBND} {input.snifflesBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_w_svim_SSm:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.SSm.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.SSm.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.SSm.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.SSm.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                #svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                #cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/SSm/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/SSm/tp-call.vcf"),
                tpDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/SSm/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/SSm/tp-call.vcf"),
                tpBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/tp-call.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteSVBND} {input.svimBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_w_svim_asm_SSm:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.SSm.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.SSm.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.SSm.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.SSm.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm/tp-call.vcf"),
                tpBNDC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm/tp-base.vcf"),
                tpBNDB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimASMALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.cuteSVDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteSVINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteSVBND} {input.svimASMBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_sniffles_w_svim_asm_SSm:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.SSm.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.SSm.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.SSm.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.SSm.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.SSm.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.SSm.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.SSm.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.SSm.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-call.vcf"),
                tpDUPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-call.vcf"),
                tpBNDC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-base.vcf"),
                tpDUPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-base.vcf"),
                tpBNDB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimASMALL} {input.snifflesALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.snifflesINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.snifflesDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.snifflesINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.snifflesBND} {input.svimASMBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_svim_w_svim_asm_SSm:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.SSm.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.SSm.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.SSm.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.SSm.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.SSm.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.SSm.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.SSm.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.SSm.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                svimSVIMASMBNDTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                svimSVIMASMBNDTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimASMALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.svimINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_pairs.sh {input.svimDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.svimINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.svimBND} {input.svimASMBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_w_pav_SSm:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVDEL} {input.pavDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINS} {input.pavINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteSVINV} {input.pavINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_w_sniffles_SSm:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.SSm.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.SSm.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.SSm.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavALL} {input.snifflesALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_w_svim_SSm:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.SSm.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.SSm.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.SSm.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.pavINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_w_svim_asm_SSm:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.SSm.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.SSm.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.SSm.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/summary.txt"),
                tpDELC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                tpINSC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/tp-call.vcf"),
                tpINVC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/tp-call.vcf"),
                tpDELB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                tpINSB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/tp-base.vcf"),
                tpINVB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/tp-base.vcf")
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
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavALL} {input.svimASMALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.pavINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.pavINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_sniffles_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-call.vcf"),
                setTwoBNDTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-base.vcf"),
                setTwoBNDTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                setOneBND=str(CUTESV_PREFIX + ".BND.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.txt"),
                tpCallSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/summary.txt"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpCallBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/tp-base.vcf"),
                #tpBaseDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPBase/tp-call.vcf"),
                #tpBaseINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPBase/tp-call.vcf"),
                #tpBaseDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPBase/tp-call.vcf"),
                #tpBaseINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPBase/tp-call.vcf"),
                #tpBaseBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase/tp-call.vcf"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPBase/tp-base.vcf"),
                tpBaseBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm"),
                setTwoBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneBND} {params.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_pav_svim_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.SSm.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_sniffles_svim_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_svim_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_pav_sniffles_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.SSm.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_pav_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.SSm.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_sniffles_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setOneDEL=str(PAV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(PAV_PREFIX + ".INS.SSm.vcf"),
                setOneINV=str(PAV_PREFIX + ".INV.SSm.vcf")
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase/tp-base.vcf"),
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_svim_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoSummaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoBNDTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setTwoBNDTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                setOneBND=str(CUTESV_PREFIX + ".BND.vcf"),
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                tpCallSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpCallBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPBase/tp-base.vcf"),
                tpBaseBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm"),
                setTwoBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneBND} {params.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_sniffles_svim_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoSummaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoBNDTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setTwoBNDTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-base.vcf"),
                setOneDEL=str(SNIFFLES_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(SNIFFLES_PREFIX + ".INS.SSm.vcf"),
                setOneDUP=str(SNIFFLES_PREFIX + ".DUP.SSm.vcf"),
                setOneINV=str(SNIFFLES_PREFIX + ".INV.SSm.vcf"),
                setOneBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                tpCallSummaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallBNDTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpCallBNDTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPBase/tp-base.vcf"),
                tpBaseBNDTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm"),
                setTwoBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneBND} {params.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_sniffles_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoSummaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoDUPTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoBNDTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoDUPTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setTwoBNDTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/tp-base.vcf"),
                setOneDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                setOneINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                setOneDUP=str(CUTESV_PREFIX + ".DUP.SSm.vcf"),
                setOneINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
                setOneBND=str(CUTESV_PREFIX + ".BND.vcf"),
        output:
                tpCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                tpCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                tpCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                tpCallSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall/summary.txt"),
                tpCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/tp-call.vcf"),
                tpCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/tp-call.vcf"),
                tpCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/tp-call.vcf"),
                tpCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/tp-call.vcf"),
                tpCallBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall/tp-call.vcf"),
                tpCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/tp-base.vcf"),
                tpCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/tp-base.vcf"),
                tpCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/tp-base.vcf"),
                tpCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/tp-base.vcf"),
                tpCallBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall/tp-base.vcf"),
                tpBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                tpBaseSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPBase/summary.txt"),
                tpBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase/tp-base.vcf"),
                tpBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPBase/tp-base.vcf"),
                tpBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase/tp-base.vcf"),
                tpBaseBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPBase/tp-base.vcf")
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
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm"),
                setTwoBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_trips.sh {input.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_trips.sh {input.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_trips.sh {input.setOneBND} {params.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_sniffles_svim_svim_asm_SSm:
        input:
                cuteSniffDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/tp-call.vcf"),
                cuteSniffINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/tp-call.vcf"),
                cuteSniffDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/tp-call.vcf"),
                cuteSniffINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/tp-call.vcf"),
                cuteSniffBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/tp-call.vcf"),
                cuteSniffDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/tp-base.vcf"),
                cuteSniffINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/tp-base.vcf"),
                cuteSniffDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/tp-base.vcf"),
                cuteSniffINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/tp-base.vcf"),
                cuteSniffBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/tp-base.vcf"),
                cuteSniffDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/summary.txt"),
                cuteSniffINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/summary.txt"),
                cuteSniffDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/summary.txt"),
                cuteSniffINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/summary.txt"),
                cuteSniffBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt"),
                svimSVIMASMDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                svimSVIMASMINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                svimSVIMASMDUPTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-call.vcf"),
                svimSVIMASMINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                svimSVIMASMBNDTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-call.vcf"),
                svimSVIMASMDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                svimSVIMASMINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                svimSVIMASMDUPTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/tp-base.vcf"),
                svimSVIMASMINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                svimSVIMASMBNDTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-base.vcf"),
                svimSVIMASMDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                svimSVIMASMINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                svimSVIMASMDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.txt"),
                svimSVIMASMINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                svimSVIMASMBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/summary.txt"),
                callTPCalLDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseDUPTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseBNDTPB=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallDUPTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallBNDTPC=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm"),
                setOneDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm"),
                setOneBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                setTwoDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm"),
                setTwoBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND")
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.sniffCuteALLTP} {input.svimASMSVIMALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type_quads.sh {params.setOneDUP} {params.setTwoDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DUP/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneBND} {params.setTwoBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/BND"

rule truvari_bench_cuteSV_pav_sniffles_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_pav_sniffles_svim_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_pav_svim_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm"),
                setOneINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm"),
                setOneINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_pav_sniffles_svim_svim_asm_SSm:
        input:
                setTwoSummaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                setTwoSummaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                setTwoSummaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                setTwoDELTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                setTwoINSTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                setTwoINVTPC=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-call.vcf"),
                setTwoDELTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/tp-base.vcf"),
                setTwoINSTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/tp-base.vcf"),
                setTwoINVTPB=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/tp-base.vcf"),
                setOneSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/summary.txt"),
                setOneSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/summary.txt"),
                setOneSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/summary.txt"),
                setOneDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/tp-call.vcf"),
                setOneINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/tp-call.vcf"),
                setOneINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/tp-call.vcf"),
                setOneDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/tp-base.vcf"),
                setOneINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/tp-base.vcf"),
                setOneINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/tp-base.vcf")
        output:
                callTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                callTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                callTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-call.vcf"),
                callTPCallDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPCallINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-base.vcf"),
                callTPBaseSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                callTPBaseDELTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINSTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/tp-base.vcf"),
                callTPBaseINVTPB=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/tp-base.vcf"),
                baseTPCallSummaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallSummaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt"),
                baseTPCallDELTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINSTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/tp-call.vcf"),
                baseTPCallINVTPC=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/tp-call.vcf")
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
                setOneDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm"),
                setOneINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm"),
                setOneINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm"),
                setTwoDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                setTwoINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                setTwoINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneDEL} {params.setTwoDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_quads.sh {params.setOneINS} {params.setTwoINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_quads.sh {params.setOneINV} {params.setTwoINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"

rule truvari_bench_cuteSV_pav_sniffles_svim_svim_asm_SSm:
        input:
                notCuteDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                notCuteINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                notCuteINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                notCuteDELTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/tp-call.vcf"),
                notCuteINSTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/tp-call.vcf"),
                notCuteINVTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/tp-call.vcf"),
                cuteDEL=str(CUTESV_PREFIX + ".DEL.SSm.vcf"),
                cuteINS=str(CUTESV_PREFIX + ".INS.SSm.vcf"),
                cuteINV=str(CUTESV_PREFIX + ".INV.SSm.vcf"),
        output:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/tp-call.vcf")
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
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteDEL} {input.notCuteDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/DEL/SSm;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_pairs.sh {input.cuteINS} {input.notCuteINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INS/SSm;\n"
                "bash ./Scripts/compare_breakends_w_truvari_pairs.sh {input.cuteINV} {input.notCuteINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix}/INV/SSm"
