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
                snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt")
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
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesBND} {input.svimBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_sniffles_w_cuteSV:
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
                snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/summary.txt"),
                sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                sniffCuteDELTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/tp-call.vcf"),
                sniffCutetpINSTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/tp-call.vcf"),
                sniffCuteDUPTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/tp-call.vcf"),
                sniffCuteINVTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/tp-call.vcf"),
                sniffCuteBNDTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="Sniffles-CuteSV"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesDEL} {input.cuteSVDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINS} {input.cuteSVINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesDUP} {input.cuteSVDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesINV} {input.cuteSVINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.snifflesBND} {input.cuteSVBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_svim_w_cuteSV:
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
                svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="SVIM-CuteSV"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimDEL} {input.cuteSVDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimINS} {input.cuteSVINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimDUP} {input.cuteSVDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimINV} {input.cuteSVINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimBND} {input.cuteSVBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_svim_asm_w_cuteSV:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVDUP=str(CUTESV_PREFIX + ".DUP.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf"),
                cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="SVIM-ASM-CuteSV"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMDEL} {input.cuteSVDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMINS} {input.cuteSVINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMDUP} {input.cuteSVDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMINV} {input.cuteSVINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMBND} {input.cuteSVBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_svim_asm_w_sniffles:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.vcf"),
                snifflesDUP=str(SNIFFLES_PREFIX + ".DUP.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.vcf"),
                snifflesBND=str(SNIFFLES_PREFIX + ".BND.vcf"),
                snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="SVIM-ASM-Sniffles"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMALL} {input.snifflesALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMDUP} {input.snifflesDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMBND} {input.snifflesBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_svim_asm_w_svim:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/BND/summary.txt"),
                svimASMSVIMALLTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                svimASMSVIMDELTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DEL/tp-call.vcf"),
                svimASMSVIMINSTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INS/tp-call.vcf"),
                svimASMSVIMDUPTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DUP/tp-call.vcf"),
                svimASMSVIMINVTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INV/tp-call.vcf"),
                svimASMSVIMBNDTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/BND/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="SVIM-ASM-SVIM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMDUP} {input.svimDUP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimASMBND} {input.svimBND} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_pav_w_cuteSV:
        input:
                cuteSVDEL=str(CUTESV_PREFIX + ".DEL.vcf"),
                cuteSVINS=str(CUTESV_PREFIX + ".INS.vcf"),
                cuteSVINV=str(CUTESV_PREFIX + ".INV.vcf"),
                cuteSVALL=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/PAV-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-CuteSV/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-CuteSV/INV/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="PAV-CuteSV"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.cuteSVALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.cuteSVDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.cuteSVINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.cuteSVINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_sniffles:
        input:
                snifflesDEL=str(SNIFFLES_PREFIX + ".DEL.vcf"),
                snifflesINS=str(SNIFFLES_PREFIX + ".INS.vcf"),
                snifflesINV=str(SNIFFLES_PREFIX + ".INV.vcf"),
                snifflesALL=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/summary.txt"),
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
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.snifflesALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.snifflesDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.snifflesINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.snifflesINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_svim:
        input:
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/summary.txt"),
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
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.svimALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.svimDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.svimINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.svimINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_pav_w_svim_asm:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMALL=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/summary.txt"),
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
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.svimASMALL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.svimASMDEL} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.svimASMINS} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.svimASMINV} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"

rule truvari_bench_sniffles_cuteSV_svim:
        input:
                summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/summary.txt"),
                sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                sniffCuteDELTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/tp-call.vcf"),
                sniffCuteINSTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/tp-call.vcf"),
                sniffCuteDUPTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/tp-call.vcf"),
                sniffCuteINVTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/tp-call.vcf"),
                sniffCuteBNDTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/summary.txt"),
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf"),
                svimALL=str(SVIM_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/All-Read-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/All-Read-Callers/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/All-Read-Callers/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/All-Read-Callers/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/All-Read-Callers/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/All-Read-Callers/BND/summary.txt")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="All-Read-Callers"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimALL} {input.sniffCuteALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimDEL} {input.sniffCuteDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimINS} {input.sniffCuteINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimDUP} {input.sniffCuteDUPTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimINV} {input.sniffCuteINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.svimBND} {input.sniffCuteBNDTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_sniffles_cuteSV_svim_asm_svim:
        input:
                sniffCuteALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/tp-call.vcf"),
                sniffCuteDELTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/tp-call.vcf"),
                sniffCuteINSTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/tp-call.vcf"),
                sniffCuteDUPTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/tp-call.vcf"),
                sniffCuteINVTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/tp-call.vcf"),
                sniffCuteBNDTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/summary.txt"),
                sniffCuteALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                sniffCuteDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/summary.txt"),
                sniffCuteINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/summary.txt"),
                sniffCuteDUP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/summary.txt"),
                sniffCuteINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/summary.txt"),
                sniffCuteBND=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/summary.txt"),
                svimASMSVIMALLTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                svimASMSVIMDELTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DEL/tp-call.vcf"),
                svimASMSVIMINSTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INS/tp-call.vcf"),
                svimASMSVIMDUPTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DUP/tp-call.vcf"),
                svimASMSVIMINVTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INV/tp-call.vcf"),
                svimASMSVIMBNDTP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/BND/tp-call.vcf"),
                svimASMSVIMALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/summary.txt"),
                svimASMSVIMDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DEL/summary.txt"),
                svimASMSVIMINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INS/summary.txt"),
                svimASMSVIMDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DUP/summary.txt"),
                svimASMSVIMINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INV/summary.txt"),
                svimASMSVIMBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/BND/summary.txt")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/BND/summary.txt"),
                tpALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                tpDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DEL/tp-call.vcf"),
                tpINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INS/tp-call.vcf"),
                tpINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INV/tp-call.vcf")
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="Sniffles-CuteSV-SVIM-ASM-SVIM"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteALLTP} {input.svimASMSVIMALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteDELTP} {input.svimASMSVIMDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteINSTP} {input.svimASMSVIMINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteDUPTP} {input.svimASMSVIMDUPTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DUP;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteINVTP} {input.svimASMSVIMINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.sniffCuteBNDTP} {input.svimASMSVIMBNDTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} BND"

rule truvari_bench_pav_sniffles_cuteSV_svim_asm_svim:
        input:
                notPAVALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/summary.txt"),
                notPAVDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DEL/summary.txt"),
                notPAVINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INS/summary.txt"),
                notPAVINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INV/summary.txt"),
                notPAVALLTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/tp-call.vcf"),
                notPAVDELTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DEL/tp-call.vcf"),
                notPAVINSTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INS/tp-call.vcf"),
                notPAVINVTP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INV/tp-call.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf"),
                pavALL=str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                summaryALL=str(config["truvariResultsFolder"] + "/All-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/All-Callers/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/All-Callers/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/All-Callers/INV/summary.txt"),
        threads: 10
        params:
               refGenome=REF_FILTERED,
               minOverlap=config["overlapThreshold"],
               maxRefDist=config["maxRefDistance"],
               minSize=config["minSizeForSVs"],
               maxSize=config["maxSizeForSVs"],
               truvariDir=config["truvariResultsFolder"],
               toolsPrefix="All-Callers"
        shell:
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavALL} {input.notPAVALLTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} ALL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavDEL} {input.notPAVDELTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} DEL;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINS} {input.notPAVINSTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INS;\n"
                "bash ./Scripts/compare_sv_files_w_truvari.sh {input.pavINV} {input.notPAVINVTP} {params.refGenome} {params.minSize} {params.maxSize} {params.minOverlap} {params.maxRefDist} {params.truvariDir}/{params.toolsPrefix} INV"
