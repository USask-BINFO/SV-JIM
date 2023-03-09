rule align_LR_w_minimap2:
        input:
                str(LR_PREFIX + ".fastq")
        output:
                str(MNMP2_READS_PREFIX + ".sam")
        threads: 3
        params:
                mnmp2Preset=config["presetForLR"],
                zDrop=config["minimapZDropForLR"],
                refGenome=REF_FILTERED,
                alignOutDir=ALIGN_DIR
        shell:
                "mkdir -p {params.alignOutDir};\n"
                "minimap2 -t {threads} --MD -a -z {params.zDrop} -x {params.mnmp2Preset} -Y {params.refGenome} {input} > {output}"

rule align_both_assemblies_w_minimap2:
        input:
                REF_FILTERED,
                QRY_FILTERED
        output:
                str(MNMP2_GENOMES_PREFIX + ".sam")
        threads: 3
        params:
                mnmp2Preset=config["presetForAssemblies"],
                alignOutDir=ALIGN_DIR
        shell:
                "mkdir -p {params.alignOutDir};\n"
                "minimap2 -a -x {params.mnmp2Preset} --cs -r2k -t {threads} {input} > {output}" #settings from svim-asm git
