rule sv_calling_w_cuteSV:
        input:
                indexFile=str(MNMP2_READS_PREFIX + ".sorted.bam.bai"),
                inputFile=str(MNMP2_READS_PREFIX + ".sorted.bam")
        output:
                str(CUTESV_PREFIX + ".ALL.unfiltered.vcf")
        threads: config["threads"]
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                clusterBias=config["maxClusterBias"],
                diffRatio=config["diffRatio"],
                refGenome=REF_FILTERED,
                svOutDir=str(SV_RESULTS_DIR + "/CuteSV/")
        conda:
                config["cuteSVCondaEnvYAML"]
        shell:
                "cuteSV --min_size {params.minSize} --max_size {params.maxSize} -s {params.minSupp} --max_cluster_bias_INS {params.clusterBias} "
                "--diff_ratio_merging_INS {params.diffRatio} --max_cluster_bias_DEL {params.clusterBias} --diff_ratio_merging_DEL {params.diffRatio} {input.inputFile} "
                "{params.refGenome} {output} {params.svOutDir}"

rule sv_calling_w_sniffles2:
        input:
                indexFile=str(MNMP2_READS_PREFIX + ".sorted.bam.bai"),
                inputFile=str(MNMP2_READS_PREFIX + ".sorted.bam")
        output:
                str(SNIFFLES_PREFIX + ".ALL.unfiltered.vcf")
        threads: config["threads"]
        params:
                minMAPQ=config["minMAPQForSVs"],
                minSupp=config["minSuppReadsForSVs"],
                minSize=config["minSizeForSVs"],
                refGenome=REF_FILTERED
        conda:
                config["sniffles2CondaEnvYAML"]
        shell:
                "sniffles --threads {threads} --mapq {params.minMAPQ} --minsupport {params.minSupp} --minsvlen {params.minSize} "
                "--reference {params.refGenome} -i {input.inputFile} -v {output}"

rule sv_calling_w_SVIM:
        input:
                indexFile=str(MNMP2_READS_PREFIX + ".sorted.bam.bai"),
                inputFile=str(MNMP2_READS_PREFIX + ".sorted.bam")
        output:
                str(SVIM_PREFIX + ".ALL.unfiltered.vcf")
        threads: 1
        params:
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                refGenome=REF_FILTERED,
                refName=REF_SAMP_NAME,
                svimOutDir=str(SV_RESULTS_DIR + "/SVIM/")
        conda:
                config["svimCondaEnvYAML"]
        shell:
                "svim alignment --min_sv_size {params.minSize} --max_sv_size {params.maxSize} {params.svimOutDir} {input.inputFile} {params.refGenome};"
                "mv {params.svimOutDir}/variants.vcf {params.svimOutDir}/{params.refName}.svim.ALL.unfiltered.vcf"
