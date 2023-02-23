rule segment_cuteSV_SVs:
        input:
                str(CUTESV_PREFIX + ".filtered.ALL.vcf")
        output:
                str(CUTESV_PREFIX + ".DEL.vcf"),
                str(CUTESV_PREFIX + ".INS.vcf"),
                str(CUTESV_PREFIX + ".DUP.vcf"),
                str(CUTESV_PREFIX + ".INV.vcf"),
                str(CUTESV_PREFIX + ".BND.vcf")
        threads: 1 #config["threads"]
        params:
                CUTESV_PREFIX
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_sniffles2_SVs:
        input:
                str(SNIFFLES_PREFIX + ".filtered.ALL.vcf")
        output:
                str(SNIFFLES_PREFIX + ".DEL.vcf"),
                str(SNIFFLES_PREFIX + ".INS.vcf"),
                str(SNIFFLES_PREFIX + ".DUP.vcf"),
                str(SNIFFLES_PREFIX + ".INV.vcf"),
                str(SNIFFLES_PREFIX + ".BND.vcf")
        threads: 1 #config["threads"]
        params:
                SNIFFLES_PREFIX
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_svim_SVs:
        input:
                str(SVIM_PREFIX + ".filtered.ALL.vcf")
        output:
                str(SVIM_PREFIX + ".DEL.vcf"),
                str(SVIM_PREFIX + ".INS.vcf"),
                str(SVIM_PREFIX + ".DUP.vcf"),
                str(SVIM_PREFIX + ".INV.vcf"),
                str(SVIM_PREFIX + ".BND.vcf")
        threads: 1 #config["threads"]
        params:
                SVIM_PREFIX
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_svim_asm_SVs:
        input:
                str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf")
        output:
                str(SVIM_ASM_PREFIX + ".DEL.vcf"),
                str(SVIM_ASM_PREFIX + ".INS.vcf"),
                str(SVIM_ASM_PREFIX + ".DUP.vcf"),
                str(SVIM_ASM_PREFIX + ".INV.vcf"),
                str(SVIM_ASM_PREFIX + ".BND.vcf")
        threads: 1 #config["threads"]
        params:
                SVIM_ASM_PREFIX
        shell:
                "bash ./Scripts/segment_sv_types_w_bcftools.sh {input} {params}"

rule segment_pav_SVs:
        input:
                str(PAV_PREFIX + ".filtered.ALL.vcf")
        output:
                str(PAV_PREFIX + ".DEL.vcf"),
                str(PAV_PREFIX + ".INS.vcf"),
                str(PAV_PREFIX + ".INV.vcf")
        threads: 1 #config["threads"]
        params:
                PAV_PREFIX
        shell:
                "bash ./Scripts/segment_pav_w_bcftools.sh {input} {params}"
