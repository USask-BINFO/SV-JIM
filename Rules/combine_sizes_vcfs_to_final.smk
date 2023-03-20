rule combine_all_callers_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/fn.sorted.vcf"),
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/fn.sorted.vcf"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall"),
                callTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),

                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),

                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall"),
                
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallSSm} {params.callTPCallSml} {params.callTPCallMed} {params.callTPCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseSSm} {params.callTPBaseSml} {params.callTPBaseMed} {params.callTPBaseLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallSSm} {params.baseTPCallSml} {params.baseTPCallMed} {params.baseTPCallLrg}"

rule combine_all_read_callers_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_cuteSV_svim_asm_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_svim_svim_asm_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_asm_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_sizes_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_svim_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_pav_sniffles_svim_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_pav_svim_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/LrgFromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_cuteSV_pav_sniffles_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_cuteSV_pav_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_pav_sniffles_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/LrgFromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_cuteSV_svim_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_sniffles_svim_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/LrgFromTPBase"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_cuteSV_sniffles_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPCall"),
                tpCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall"),

                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase"),
                tpBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallSSm} {params.tpCallSml} {params.tpCallMed} {params.tpCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseSSm} {params.tpBaseSml} {params.tpBaseMed} {params.tpBaseLrg}"

rule combine_cuteSV_pav_sniffles_svim_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Base/FromTPCall/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPCall"),
                callTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPCall"),
                callTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPCall"),
                callTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPCall"),
                callTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPCall"),

                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase"),
                callTPBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPBase"),
                callTPBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPBase"),
                callTPBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPBase"),
                callTPBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPBase"),

                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall"),
                baseTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall"),
                baseTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall"),
                baseTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall"),
                baseTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallSSm} {params.callTPCallSml} {params.callTPCallMed} {params.callTPCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseSSm} {params.callTPBaseSml} {params.callTPBaseMed} {params.callTPBaseLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallSSm} {params.baseTPCallSml} {params.baseTPCallMed} {params.baseTPCallLrg}"

rule combine_cuteSV_pav_svim_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPCall"),
                callTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),

                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),

                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallSSm} {params.callTPCallSml} {params.callTPCallMed} {params.callTPCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseSSm} {params.callTPBaseSml} {params.callTPBaseMed} {params.callTPBaseLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallSSm} {params.baseTPCallSml} {params.baseTPCallMed} {params.baseTPCallLrg}"

rule combine_pav_sniffles_svim_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fn.sorted.vcf")                
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPCall"),
                callTPCallSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),

                callTPBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),

                baseTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallSSm} {params.callTPCallSml} {params.callTPCallMed} {params.callTPCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseSSm} {params.callTPBaseSml} {params.callTPBaseMed} {params.callTPBaseLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallSSm} {params.baseTPCallSml} {params.baseTPCallMed} {params.baseTPCallLrg}"

rule combine_cuteSV_pav_sniffles_svim_asm_to_final_vcf:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPBase/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fn.sorted.vcf")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase/fn.sorted.vcf"),

                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPCall"),
                callTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),

                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),

                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallSSm} {params.callTPCallSml} {params.callTPCallMed} {params.callTPCallLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseSSm} {params.callTPBaseSml} {params.callTPBaseMed} {params.callTPBaseLrg};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallSSm} {params.baseTPCallSml} {params.baseTPCallMed} {params.baseTPCallLrg}"
