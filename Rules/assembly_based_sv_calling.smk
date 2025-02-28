rule sv_calling_w_svim_asm:
        input:
                indexFile=str(MNMP2_GENOMES_PREFIX + ".sorted.bam.bai"),
                inputFile=str(MNMP2_GENOMES_PREFIX + ".sorted.bam")
        output:
                str(SVIM_ASM_PREFIX + ".ALL.unfiltered.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Assembly.benchmarking.tsv"), BENCH_REPEAT)
        params:
                minMAPQ=config["minMAPQForSVs"],
                minSize=config["minSizeForSVs"],
                maxSize=config["maxSizeForSVs"],
                svOutDir=str(SV_RESULTS_DIR +"/SVIM-ASM"),
                refGenome=REF_FILTERED
        conda:
                config["svimASMCondaEnvYAML"]
        shell:
                "mkdir -p {params.svOutDir};\n"
                "svim-asm haploid --min_mapq {params.minMAPQ} --min_sv_size {params.minSize} --max_sv_size {params.maxSize} {params.svOutDir} {input.inputFile} {params.refGenome};"
                "mv {params.svOutDir}/variants.vcf {output}"

rule sv_calling_w_pav:
        input:
                refGenome=REF_FILTERED,
                qryGenome=QRY_FILTERED
        output:
                str(SV_RESULTS_DIR + "/PAV/"+ QRY_SAMP_NAME + ".vcf.gz")
                #str(SV_RESULTS_DIR + "/PAV/pav_"+ QRY_SAMP_NAME + ".vcf.gz")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Assembly.benchmarking.tsv"), BENCH_REPEAT)
        params:
                svOutDir=str(SV_RESULTS_DIR + "/PAV/"),
                qryID=QRY_SAMP_NAME
        #conda:
        #        config["pavCondaEnvYAML"]
        shell:
                "mkdir -p {params.svOutDir};\n"
                "bash ./Scripts/run-PAV-SnakeMake-pipe.sh {threads} {params.svOutDir} {input} {params.qryID} {output}"

rule unzip_rename_and_check_headers_in_pav_results:
        input:
               str(SV_RESULTS_DIR + "/PAV/"+ QRY_SAMP_NAME + ".vcf.gz")
        output:
               str(PAV_PREFIX + ".ALL.unfiltered.vcf")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/SVCalling.Assembly.benchmarking.tsv"), BENCH_REPEAT)
        params:
               destDir=str(SV_RESULTS_DIR +"/PAV/"),
               headerFile=config["appendVCFHeadersFile"],
               tempFile=str(SV_RESULTS_DIR +"/PAV/addedHeaders.vcf")

        shell:
               "bash ./Scripts/unzip_rename_and_add_vcf_headers.sh {input} {output} {params}"
