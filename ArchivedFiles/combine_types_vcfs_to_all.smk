rule combine_all_callers_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/tp-call.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/tp-base.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/FileCombining.benchmarking.tsv"), BENCH_REPEAT)
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/summary.txt")
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
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/summary.txt")
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
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/summary.txt")
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
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/summary.txt")
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
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Base/FromTPCall/summary.txt")
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
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPCall"),
                callTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPCall"),
                callTPCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPBase"),
                callTPBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPBase"),
                callTPBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Base/FromTPCall"),
                baseTPCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Base/FromTPCall"),
                baseTPCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Base/FromTPCall"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallDUP} {params.callTPCallINV} {params.callTPCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseDUP} {params.callTPBaseINV} {params.callTPBaseBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallDUP} {params.baseTPCallINV} {params.baseTPCallBND}"

rule combine_all_read_callers_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_cuteSV_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt")
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
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_svim_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt")
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
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt")
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
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.txt")
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
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt")
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
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_sniffles_svim_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt")
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
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_svim_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_svim_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_sniffles_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_pav_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_pav_sniffles_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseINV}"

rule combine_cuteSV_svim_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_sniffles_svim_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_cuteSV_sniffles_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/FromTPBase/summary.txt")
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
                tpCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/FromTPCall"),
                tpCallINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/FromTPCall"),
                tpCallDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/FromTPCall"),
                tpCallINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/FromTPCall"),
                tpCallBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall"),
                tpBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/ALL/FromTPBase"),
                tpBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/FromTPBase"),
                tpBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/FromTPBase"),
                tpBaseDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/FromTPBase"),
                tpBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/FromTPBase"),
                tpBaseBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPBase")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpCallALL} {params.tpCallDEL} {params.tpCallINS} {params.tpCallDUP} {params.tpCallINV} {params.tpCallBND};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.tpBaseALL} {params.tpBaseDEL} {params.tpBaseINS} {params.tpBaseDUP} {params.tpBaseINV} {params.tpBaseBND}"

rule combine_cuteSV_pav_sniffles_svim_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Base/FromTPCall/summary.txt")
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
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/ALL/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_svim_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Base/FromTPCall/summary.txt")
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
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Call/FromTPCall"),
		callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Call/FromTPBase"),
		callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_pav_sniffles_svim_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Base/FromTPCall/summary.txt"),
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
                callTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"

rule combine_cuteSV_pav_sniffles_svim_asm_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Call/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Call/FromTPBase/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Base/FromTPCall/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Base/FromTPCall/summary.txt")
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
                callTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Call/FromTPCall"),
                callTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Call/FromTPCall"),
                callTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Call/FromTPCall"),
                callTPBaseALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Call/FromTPBase"),
                callTPBaseDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Call/FromTPBase"),
                callTPBaseINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Call/FromTPBase"),
                callTPBaseINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Call/FromTPBase"),
                baseTPCallALL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/ALL/Base/FromTPCall"),
                baseTPCallDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Base/FromTPCall"),
                baseTPCallINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Base/FromTPCall"),
                baseTPCallINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Base/FromTPCall")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPCallALL} {params.callTPCallDEL} {params.callTPCallINS} {params.callTPCallINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.callTPBaseALL} {params.callTPBaseDEL} {params.callTPBaseINS} {params.callTPBaseINV};\n"
                "bash ./Scripts/combine_vcf_files_basic.sh {params.baseTPCallALL} {params.baseTPCallDEL} {params.baseTPCallINS} {params.baseTPCallINV}"
