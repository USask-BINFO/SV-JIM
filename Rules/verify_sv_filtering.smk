rule verify_cuteSV_filtering_w_bcftools:
        input:
                str(CUTESV_PREFIX + ".ALL.unfiltered.vcf")
        output:
                finalFilter=str(CUTESV_PREFIX + ".filtered.ALL.vcf"),
                removedNs=str(CUTESV_PREFIX + ".ALL.NoN.vcf")
        threads: config["threads"]
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                minMAPQ=config["minMAPQForSVs"]
        shell:
                "bcftools filter -e \'REF ~ \"NNN*\" || ALT ~ \"NNN*\"\' -o {output.removedNs} {input};\n"
                "bcftools filter -e \'INFO/SVLEN<-{params.maxSize} || INFO/SVLEN>{params.maxSize} || INFO/RE<{params.minSupp}\' -o {output.finalFilter} {output.removedNs}"

rule verify_sniffles2_filtering_w_bcftools:
        input:
                str(SNIFFLES_PREFIX + ".ALL.unfiltered.vcf")
        output:
                finalFilter=str(SNIFFLES_PREFIX + ".filtered.ALL.vcf"),
                removedNs=str(SNIFFLES_PREFIX + ".ALL.NoN.vcf")
        threads: config["threads"]
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                minMAPQ=config["minMAPQForSVs"] 
        shell:
                "bcftools filter -e \'REF ~ \"NNN*\" || ALT ~ \"NNN*\"\' -o {output.removedNs} {input};\n"
                "bcftools filter -e \'QUAL<{params.minMAPQ} || INFO/SVLEN<-{params.maxSize} || INFO/SVLEN>{params.maxSize} || INFO/SUPPORT<{params.minSupp}\' -o {output.finalFilter} {output.removedNs}"

rule verify_svim_filtering_w_bcftools:
        input:
                str(SVIM_PREFIX + ".ALL.unfiltered.vcf")
        output:
                filteredInv=str(SVIM_PREFIX + ".filteredINV.ALL.vcf"),
                finalFilter=str(SVIM_PREFIX + ".filtered.ALL.vcf")
        threads: config["threads"]
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                minMAPQ=config["minMAPQForSVs"] 
        shell:
                "bcftools filter -e \'SVTYPE == \"INV\" && ((INFO/END-POS)<-{params.maxSize} || (INFO/END-POS)>{params.maxSize})\' -o {output.filteredInv} {input};\n"
                "bcftools filter -e \'QUAL<{params.minMAPQ} || INFO/SVLEN<-{params.maxSize} || INFO/SVLEN>{params.maxSize} || (INFO/END-POS)<-{params.maxSize} || (INFO/END-POS)>{params.maxSize} || INFO/SUPPORT<{params.minSupp}\' -o {output.finalFilter} {output.filteredInv}"

rule verify_svim_asm_filtering_w_bcftools:
        input:
                str(SVIM_ASM_PREFIX + ".ALL.unfiltered.vcf")
        output:
                finalFilter=str(SVIM_ASM_PREFIX + ".filtered.ALL.vcf"),
                removedNs=str(SVIM_ASM_PREFIX + ".ALL.NoN.vcf"),
                filteredInv=str(SVIM_ASM_PREFIX + ".filteredINV.ALL.vcf")
        threads: config["threads"]
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                minMAPQ=config["minMAPQForSVs"] 
        shell:
                "bcftools filter -e \'REF ~ \"NNN*\" || ALT ~ \"NNN*\"\' -o {output.removedNs} {input};\n"
                "bcftools filter -e \'SVTYPE == \"INV\" && ((INFO/END-POS)<-{params.maxSize} || (INFO/END-POS)>{params.maxSize})\' -o {output.filteredInv} {output.removedNs};\n"
                "bcftools filter -e \'INFO/SVLEN<-{params.maxSize} || INFO/SVLEN>{params.maxSize}\' -o {output.finalFilter} {output.filteredInv}"

rule verify_pav_filtering_bcftools:
        input:
                str(PAV_PREFIX + ".ALL.unfiltered.vcf")
        output:
                finalFilter=str(PAV_PREFIX + ".filtered.ALL.vcf"),
                removedNs=str(PAV_PREFIX + ".ALL.NoN.vcf")
        threads: config["threads"]
        params:
                minSize=config["minSizeForSVs"]-1,
                maxSize=config["maxSizeForSVs"],
                tempFile1=str(PAV_PREFIX + ".temp1.vcf"),
                tempFile2=str(PAV_PREFIX + ".temp2.vcf")
        shell:
                "bcftools filter -e \'INFO/SVTYPE == \"SNV\"\' -o {params.tempFile1} {input};\n"
                "bcftools filter -e \'INFO/SVLEN<{params.minSize} && INFO/SVLEN>-{params.minSize}\' -o {params.tempFile2} {params.tempFile1};\n"
                "bcftools filter -e \'REF ~ \"NNN*\" || ALT ~ \"NNN*\"\' -o {output.removedNs} {params.tempFile2};\n"
                "bcftools filter -e \'INFO/SVLEN<-{params.maxSize} || INFO/SVLEN>{params.maxSize}\' -o {output.finalFilter} {output.removedNs};\n"
                "rm {params.tempFile1} {params.tempFile2}"
