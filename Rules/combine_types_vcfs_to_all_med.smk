rule combine_all_callers_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt")
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall"),
                callTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase"),
                callTPBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall"),
                baseTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallDUP} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseDUP} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallDUP} {params.baseTPCallINV}"

rule combine_all_read_callers_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_svim_asm_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med/summary.txt"),
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_svim_svim_asm_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_asm_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_types_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_svim_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_svim_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_svim_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_sniffles_svim_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_sniffles_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/Med/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_svim_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Med/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_svim_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall"),
		callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase"),
		callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_pav_sniffles_svim_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt"),
        output:
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
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_sniffles_svim_asm_to_all_directory_Med:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Med/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"
