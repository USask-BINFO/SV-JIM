rule combine_all_callers_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Base/FromTPCall/summary.txt")
        output:
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
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall"),
                callTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall"),
                callTPCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase"),
                callTPBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase"),
                callTPBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall"),
                baseTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall"),
                baseTPCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Base/FromTPCall"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallDUP} {params.callTPCallINV} {params.callTPCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseDUP} {params.callTPBaseINV} {params.callTPBaseBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallDUP} {params.baseTPCallINV} {params.baseTPCallBND}"

rule combine_all_read_callers_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_cuteSV_svim_asm_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_svim_svim_asm_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_asm_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_types_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_svim_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_svim_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_svim_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_sniffles_svim_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_cuteSV_sniffles_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPBase/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall/fn.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                tpCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPCall"),
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/SSm/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_cuteSV_pav_sniffles_svim_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/SSm/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_svim_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall"),
		callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
		callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_pav_sniffles_svim_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt"),
        output:
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
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_sniffles_svim_asm_to_all_directory_SSm:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Base/FromTPCall/summary.txt")
        output:
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                callTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPCall"),
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/SSm/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"
