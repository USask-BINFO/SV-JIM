rule bedtools_intersect_LR_svim_w_sniffles2:
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
                svimBND=str(SVIM_PREFIX + ".BND.vcf")
        output:
                delIntersect=str(config["intersectResultsFolder"] + "/SVIM-Sniffles2.results.DEL.vcf"),
                insIntersect=str(config["intersectResultsFolder"] + "/SVIM-Sniffles2.results.INS.vcf"),
                dupIntersect=str(config["intersectResultsFolder"] + "/SVIM-Sniffles2.results.DUP.vcf"),
                invIntersect=str(config["intersectResultsFolder"] + "/SVIM-Sniffles2.results.INV.vcf"),
                bndIntersect=str(config["intersectResultsFolder"] + "/SVIM-Sniffles2.results.BND.vcf")
        threads: config["threads"]
        params:
                minOverlap=config["overlapThreshold"],
                prefixA=SVIM_PREFIX,
                allSVA=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                prefixB=SNIFFLES_PREFIX,
                allSVB=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                intersectPrefix=str(config["intersectResultsFolder"] + "/SVIM-Sniffles2")
        shell:
                "bash ./Scripts/bedtools_intersect_sv_files.sh {params.prefixA} {params.allSVA} {params.prefixB} {params.allSVB} {params.minOverlap} {params.intersectPrefix}"

rule bedtools_intersect_LR_sniffles2_w_cuteSV:
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
                cuteSVBND=str(CUTESV_PREFIX + ".BND.vcf")
        output:
                delIntersect=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.DEL.vcf"),
                insIntersect=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.INS.vcf"),
                dupIntersect=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.DUP.vcf"),
                invIntersect=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.INV.vcf"),
                bndIntersect=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.BND.vcf")
        threads: config["threads"]
        params:
                minOverlap=config["overlapThreshold"],
                prefixA=SNIFFLES_PREFIX,
                allSVA=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                prefixB=CUTESV_PREFIX,
                allSVB=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                intersectPrefix=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV")
        shell:
                "bash ./Scripts/bedtools_intersect_sv_files.sh {params.prefixA} {params.allSVA} {params.prefixB} {params.allSVB} {params.minOverlap} {params.intersectPrefix}"

rule bedtools_intersect_LR_svim_w_cuteSV:
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
                svimBND=str(SVIM_PREFIX + ".BND.vcf")
        output:
                delIntersect=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.DEL.vcf"),
                insIntersect=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.INS.vcf"),
                dupIntersect=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.DUP.vcf"),
                invIntersect=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.INV.vcf"),
                bndIntersect=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.BND.vcf")
        threads: config["threads"]
        params:
                minOverlap=config["overlapThreshold"],
                prefixA=SVIM_PREFIX,
                allSVA=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                prefixB=CUTESV_PREFIX,
                allSVB=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                intersectPrefix=str(config["intersectResultsFolder"] + "/SVIM-cuteSV")
        shell:
                "bash ./Scripts/bedtools_intersect_sv_files.sh {params.prefixA} {params.allSVA} {params.prefixB} {params.allSVB} {params.minOverlap} {params.intersectPrefix}"

rule bedtools_intersect_pav_svim_asm:
        input:
                svimASMDEL=str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                svimASMINS=str(SVIM_ASM_PREFIX + ".INS.vcf"),
                svimASMDUP=str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                svimASMINV=str(SVIM_ASM_PREFIX + ".INV.vcf"),
                svimASMBND=str(SVIM_ASM_PREFIX + ".BND.vcf"),
                pavDEL=str(PAV_PREFIX + ".DEL.vcf"),
                pavINS=str(PAV_PREFIX + ".INS.vcf"),
                pavINV=str(PAV_PREFIX + ".INV.vcf")
        output:
                delIntersect=str(config["intersectResultsFolder"] + "/PAV-SVIM-ASM.results.DEL.vcf"),
                insIntersect=str(config["intersectResultsFolder"] + "/PAV-SVIM-ASM.results.INS.vcf"),
                invIntersect=str(config["intersectResultsFolder"] + "/PAV-SVIM-ASM.results.INV.vcf")
        threads: config["threads"]
        params:
                minOverlap=config["overlapThreshold"],
                prefixA=QRY_FILTERED,
                allSVA=str(QRY_FILTERED + ".vcf"),
                prefixB=SVIM_ASM_PREFIX,
                allSVB=str(SVIM_ASM_PREFIX + ".ALL.vcf"),
                intersectPrefix=str(config["intersectResultsFolder"] + "/PAV-SVIM-ASM")
        shell:
                "bash ./Scripts/bedtools_intersect_pav_files.sh {params.prefixA} {params.allSVA} {params.prefixB} {params.allSVB} {params.minOverlap} {params.intersectPrefix}"

rule bedtools_intersect_LR_all_callers:
        input:
                cuteSVIMDEL=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.DEL.vcf"),
                cuteSVIMINS=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.INS.vcf"),
                cuteSVIMDUP=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.DUP.vcf"),
                cuteSVIMINV=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.INV.vcf"),
                cuteSVIMBND=str(config["intersectResultsFolder"] + "/SVIM-cuteSV.results.BND.vcf"),
                cuteSniffDEL=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.DEL.vcf"),
                cuteSniffINS=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.INS.vcf"),
                cuteSniffDUP=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.DUP.vcf"),
                cuteSniffINV=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.INV.vcf"),
                cuteSniffBND=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.BND.vcf"),
                svimDEL=str(SVIM_PREFIX + ".DEL.vcf"),
                svimINS=str(SVIM_PREFIX + ".INS.vcf"),
                svimDUP=str(SVIM_PREFIX + ".DUP.vcf"),
                svimINV=str(SVIM_PREFIX + ".INV.vcf"),
                svimBND=str(SVIM_PREFIX + ".BND.vcf")
        output:
                delIntersect=str(config["intersectResultsFolder"] + "/all-LR-callers.results.DEL.vcf"),
                insIntersect=str(config["intersectResultsFolder"] + "/all-LR-callers.results.INS.vcf"),
                dupIntersect=str(config["intersectResultsFolder"] + "/all-LR-callers.results.DUP.vcf"),
                invIntersect=str(config["intersectResultsFolder"] + "/all-LR-callers.results.INV.vcf"),
                bndIntersect=str(config["intersectResultsFolder"] + "/all-LR-callers.results.BND.vcf")
        threads: config["threads"]
        params:
                minOverlap=config["overlapThreshold"],
                prefixA=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV"),
                prevIntersect=str(config["intersectResultsFolder"] + "/Sniffles2-cuteSV.results.DEL.vcf"),
                prefixB=SVIM_PREFIX,
                allSVB=str(SVIM_PREFIX + ".filtered.ALL.vcf"),
                intersectPrefix=str(config["intersectResultsFolder"] + "/all-LR-callers")
        shell:
                "bash ./Scripts/bedtools_intersect_all_LR_files.sh {params.prefixA} {params.prevIntersect} {params.prefixB} {params.allSVB} {params.minOverlap} {params.intersectPrefix}"
