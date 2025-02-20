rule align_LR_w_minimap2:
        input:
                readFilesList=config["readFilesList"],
                reformatConfirm=str(LR_PREFIX + ".fastq"),
                refGenome=REF_FILTERED
        output:
                str(MNMP2_READS_PREFIX + ".sam")
        threads: config["threads"]
        benchmark: 
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                mnmp2Preset=config["presetForLR"],
                zDrop=config["minimapZDropForLR"],
                alignOutDir=ALIGN_DIR,
                readsDir=LR_DIR
        shell:
                "bash ./Scripts/align_reads_w_minimap2.sh {threads} {params.zDrop} {params.mnmp2Preset} {input.refGenome} {output} {params.alignOutDir} {params.readsDir} {input.readFilesList}"
                #"mkdir -p {params.alignOutDir};\n"
                #"minimap2 -t {threads} --MD -a -z {params.zDrop} -x {params.mnmp2Preset} -Y {params.refGenome} {input} > {output}"

rule align_both_assemblies_w_minimap2:
        input:
                REF_FILTERED,
                QRY_FILTERED
        output:
                str(MNMP2_GENOMES_PREFIX + ".sam")
        threads: config["threads"]
        benchmark:
                repeat(str(BENCH_DIR + "/Alignment.benchmarking.tsv"), BENCH_REPEAT)
        params:
                mnmp2Preset=config["presetForAssemblies"],
                alignOutDir=ALIGN_DIR
        shell:
                "mkdir -p {params.alignOutDir};\n"
                "minimap2 -a -x {params.mnmp2Preset} --cs -r2k -t {threads} {input} > {output}" #settings from svim-asm git
