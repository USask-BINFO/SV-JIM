rule evaluate_sniffles_w_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_sniffles_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/SSm/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/SSm/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_w_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_w_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_pav_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/SSm.calculated_rates.tsv")
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

rule evaluate_pav_w_sniffles_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/SSm.calculated_rates.tsv")
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

rule evaluate_pav_w_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/SSm.calculated_rates.tsv")
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

rule evaluate_pav_w_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_sniffles_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/SSm.calculated_rates.tsv")
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

rule evaluate_pav_sniffles_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/SSm.calculated_rates.tsv")
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

rule evaluate_pav_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_pav_sniffles_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.json"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.json"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_pav_sniffles_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/SSm.calculated_rates.tsv")
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

rule evaluate_cuteSV_pav_sniffles_svim_svim_asm_SSm:
        input:
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.json"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.json"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.json"),
                #summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/summary.json"),
                #summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/summary.json"),
                #summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/summary.json")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/SSm.calculated_rates.tsv")
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
