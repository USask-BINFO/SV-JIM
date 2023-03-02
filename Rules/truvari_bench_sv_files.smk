rule truvari_bench_sniffles_w_svim:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                #snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                #svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt"),
                sniffSVIMDELTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/tp-call.vcf"),
                sniffSVIMINSTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/tp-call.vcf"),
                sniffSVIMDUPTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/tp-call.vcf"),
                sniffSVIMINVTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/tp-call.vcf"),
                sniffSVIMBNDTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="Sniffles-SVIM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.snifflesDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.snifflesBND} {input.svimBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_cuteSV_w_sniffles:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                #snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                #cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt"),
                #sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                cuteSniffDELTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/tp-call.vcf"),
                cuteSniffINSTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/tp-call.vcf"),
                cuteSniffDUPTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/tp-call.vcf"),
                cuteSniffINVTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/tp-call.vcf"),
                cuteSniffBNDTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-Sniffles"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.cuteSVDUP} {input.snifflesDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSVBND}{input.snifflesBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_cuteSV_w_svim:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                #svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                #cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-SVIM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.cuteSVDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSVBND} {input.svimBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_cuteSV_w_svim_asm:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                #cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                #svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-SVIM-ASM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.cuteSVDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSVINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSVBND} {input.svimASMBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_sniffles_w_svim_asm:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                #snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                #svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="Sniffles-SVIM-ASM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMALL} {input.snifflesALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.snifflesDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.snifflesINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.snifflesBND} {input.svimASMBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_svim_w_svim_asm:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                #svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                #svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt"),
                #svimASMSVIMALLTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                svimSVIMASMDELTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/tp-call.vcf"),
                svimSVIMASMINSTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/tp-call.vcf"),
                svimSVIMASMDUPTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/tp-call.vcf"),
                svimSVIMASMINVTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/tp-call.vcf"),
                svimSVIMASMBNDTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="SVIM-SVIM-ASM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.svimDUP} {input.svimASMDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.svimINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.svimBND} {input.svimASMBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_cuteSV_w_pav:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                #cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                #pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/PAV-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-PAV"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVDEL} {input.pavDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINS} {input.pavINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINV} {input.pavINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_sniffles:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.vcf"),
                #snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                #pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="PAV-Sniffles"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.snifflesALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_svim:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                #svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                #pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="PAV-SVIM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_svim_asm:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                #svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                #pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="PAV-SVIM-ASM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.svimASMALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.pavINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_cuteSV_sniffles_svim:
        input:
                #summaryAll=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt"),
                #sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                sniffSVIMDELTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/tp-call.vcf"),
                sniffSVIMINSTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/tp-call.vcf"),
                sniffSVIMDUPTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/tp-call.vcf"),
                sniffSVIMINVTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/tp-call.vcf"),
                sniffSVIMBNDTP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/tp-call.vcf"),
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                #svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/All-Read-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-Sniffles-SVIM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimALL} {input.sniffCuteALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVDEL} {input.sniffSVIMDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINS} {input.sniffSVIMINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.cuteSVDUP} {input.sniffSVIMDUPTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSVINV} {input.sniffSVIMINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSVBND} {input.sniffSVIMBNDTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_cuteSV_sniffles_svim_svim_asm:
        input:
                #sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                cuteSniffDELTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/tp-call.vcf"),
                cuteSniffINSTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/tp-call.vcf"),
                cuteSniffDUPTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/tp-call.vcf"),
                cuteSniffINVTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/tp-call.vcf"),
                cuteSniffBNDTP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/tp-call.vcf"),
                #sniffCuteALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                cuteSniffDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/summary.txt"),
                cuteSniffINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/summary.txt"),
                cuteSniffDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/summary.txt"),
                cuteSniffINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/summary.txt"),
                cuteSniffBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt"),
                #svimASMSVIMALLTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                svimSVIMASMDELTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/tp-call.vcf"),
                svimSVIMASMINSTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/tp-call.vcf"),
                svimSVIMASMDUPTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/tp-call.vcf"),
                svimSVIMASMINVTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/tp-call.vcf"),
                svimSVIMASMBNDTP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/tp-call.vcf"),
                #svimASMSVIMALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/summary.txt"),
                svimSVIMASMDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/summary.txt"),
                svimSVIMASMINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/summary.txt"),
                svimSVIMASMDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/summary.txt"),
                svimSVIMASMINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/summary.txt"),
                svimSVIMASMBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/summary.txt"),
                #tpALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                tpDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-Sniffles-SVIM-SVIM-ASM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteALLTP} {input.svimASMSVIMALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSniffDELTP} {input.svimSVIMASMDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteSniffINSTP} {input.svimSVIMASMINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari_ignore_type.sh {input.cuteSniffDUPTP} {input.svimSVIMASMDUPTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSniffINVTP} {input.svimSVIMASMINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteSniffBNDTP} {input.svimSVIMASMBNDTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_cuteSV_pav_sniffles_svim_svim_asm:
        input:
                #notPAVALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/summary.txt"),
                notCuteDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                notCuteINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                notCuteINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt"),
                #notPAVALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                notCuteDELTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/tp-call.vcf"),
                notCuteINSTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/tp-call.vcf"),
                notCuteINVTP=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/tp-call.vcf"),
                cuteDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteINV=str(CUTESV_PREFIX + ".INV.vcf"),
                #pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                #summaryAll=str(config["truvariResultsFolder"] + "/All-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt"),
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="CuteSV-PAV-Sniffles-SVIM-SVIM-ASM"
        shell:
                #"bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.notPAVALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteDEL} {input.notCuteDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.cuteINS} {input.notCuteINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_breakends_w_truvari.sh {input.cuteINV} {input.notCuteINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"
