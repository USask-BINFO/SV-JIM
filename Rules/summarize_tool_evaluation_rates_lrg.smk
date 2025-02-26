rule evaluate_sniffles_w_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_w_sniffles_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_w_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Lrg/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_w_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_sniffles_w_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_svim_w_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_w_pav_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_w_sniffles_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_w_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_w_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_sniffles_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_sniffles_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_sniffles_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_sniffles_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_sniffles_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_sniffles_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_svim_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_pav_sniffles_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/Lrg.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_svim_svim_asm_Lrg:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.json"),
                #summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/summary.json"),
                #summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/summary.json"),
                #summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/Lrg.calculated_rates.tsv")
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
