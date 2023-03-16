rule combine_all_callers_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall/fn.sorted.vcf"),
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall"),
                callTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase"),
                callTPBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall"),
                baseTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallDUP} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseDUP} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallDUP} {params.baseTPCallINV}"

rule combine_all_read_callers_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_svim_asm_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg/summary.txt"),
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_svim_svim_asm_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_asm_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_types_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_svim_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_svim_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_svim_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_sniffles_svim_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_sniffles_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Lrg/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_svim_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Base/FromTPCall/summary.txt")
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Lrg/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_svim_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt")
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall"),
		callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),
		callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_pav_sniffles_svim_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt"),
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Lrg/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_sniffles_svim_asm_to_all_directory_Lrg:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Base/FromTPCall/summary.txt")
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Lrg/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"
