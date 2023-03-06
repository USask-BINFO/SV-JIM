rule aggregate_cuteSV_min_two:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/tp-base.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minTwo.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/CuteSV"),
                requiredCallers="minTwo"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_pav_min_two:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/tp-base.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/PAV/tp.minTwo.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/PAV"),
                requiredCallers="minTwo"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_sniffles_min_two:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/tp-base.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minTwo.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/Sniffles"),
                requiredCallers="minTwo"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_svim_min_two:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/tp-base.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/SVIM/tp.minTwo.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/SVIM"),
                requiredCallers="minTwo"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_svim_asm_min_two:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/tp-call.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minTwo.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/SVIM-ASM"),
                requiredCallers="minTwo"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_svim_asm_min_three:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf") 
        output:
                str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minThree.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/SVIM-ASM"),
                requiredCallers="minThree"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_cuteSV_min_three:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf") 
        output:
                str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minThree.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/CuteSV"),
                requiredCallers="minThree"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_pav_min_three:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf") 
        output:
                str(config["aggregatedResultsFolder"] + "/PAV/tp.minThree.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/PAV"),
                requiredCallers="minThree"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_sniffles_min_three:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf") 
        output:
                str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minThree.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/Sniffles"),
                requiredCallers="minThree"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_svim_min_three:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf") 
        output:
                str(config["aggregatedResultsFolder"] + "/SVIM/tp.minThree.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/SVIM"),
                requiredCallers="minThree"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_cuteSV_min_four:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf") 
        output:
                str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minFour.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/CuteSV"),
                requiredCallers="minFour"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_pav_min_four:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/PAV/tp.minFour.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/PAV"),
                requiredCallers="minFour"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_sniffles_min_four:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minFour.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/Sniffles"),
                requiredCallers="minFour"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_svim_min_four:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/SVIM/tp.minFour.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/SVIM"),
                requiredCallers="minFour"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"

rule aggregate_svim_asm_min_four:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf")
        output:
                str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minFour.sorted.vcf")
        threads: 1
        params:
                outputDir=str(config["aggregatedResultsFolder"] + "/SVIM-ASM"),
                requiredCallers="minFour"
        shell:
                "bash ./Scripts/aggregate_truvari_tp_files_no_dups.sh {params} {input}"
