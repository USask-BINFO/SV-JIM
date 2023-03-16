rule combine_all_callers_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt")
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall"),
                callTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase"),
                callTPBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall"),
                baseTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallDUP} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseDUP} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallDUP} {params.baseTPCallINV}"

rule combine_all_read_callers_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_svim_asm_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Sml/summary.txt"),
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_svim_svim_asm_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_asm_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_types_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_svim_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_svim_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_svim_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_sniffles_svim_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_sniffles_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Sml/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_svim_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Sml/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_svim_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall"),
		callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
		callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_pav_sniffles_svim_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt"),
        output:
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
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_sniffles_svim_asm_to_all_directory_Sml:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Sml/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"
