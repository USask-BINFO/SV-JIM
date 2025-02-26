rule evaluate_sniffles_w_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="Sniffles2",
               toolB="SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_sniffles_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="Sniffles2"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Med/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_w_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="Sniffles2",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_w_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="SVIM",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_pav_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_sniffles_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="Sniffles"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="Sniffles-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="Sniffles-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-Sniffles"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-PAV",
               toolB="Sniffles-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-PAV",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV-Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-PAV",
               toolB="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_svim_asm_Med:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.json"),
                #summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/summary.json"),
                #summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/summary.json"),
                #summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/Med.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-Sniffles-SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"
