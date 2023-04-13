rule evaluate_sniffles_w_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/Lrg/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/SSm/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Sml/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Med/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/Lrg/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="Sniffles2",
               toolB="SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_sniffles_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/Lrg/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/SSm/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Sml/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Med/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/Lrg/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="Sniffles2"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/Lrg/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/SSm/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Sml/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Med/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/Lrg/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/Lrg/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/SSm/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Sml/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Med/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/Lrg/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_w_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/Lrg/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/SSm/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Sml/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Med/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/Lrg/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="Sniffles2",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_w_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/Lrg/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/SSm/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Sml/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Med/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/Lrg/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="SVIM",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_pav_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_sniffles_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="Sniffles"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/SSm/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Sml/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Med/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/Lrg/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/SSm/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Sml/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Med/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/Lrg/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/SSm/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Sml/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Med/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/Lrg/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/SSm/FromTPCall/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Sml/FromTPCall/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Med/FromTPCall/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="Sniffles-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INS/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/INV/Lrg/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INS/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/INV/Lrg/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="Sniffles-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INS/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/INV/Lrg/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-Sniffles"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV",
               toolB="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/BND/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/SSm/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Sml/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Med/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DEL/Lrg/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/SSm/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Sml/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Med/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INS/Lrg/FromTPCall/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/SSm/FromTPCall/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Sml/FromTPCall/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Med/FromTPCall/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/DUP/Lrg/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/SSm/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Sml/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Med/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/INV/Lrg/FromTPCall/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/BND/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),

                summaryDUPSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/SSm/Call/FromTPCall/summary.txt"),
                summaryDUPSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Sml/Call/FromTPCall/summary.txt"),
                summaryDUPMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Med/Call/FromTPCall/summary.txt"),
                summaryDUPLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/Lrg/Call/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt"),

                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/Call/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DUP {output} A {input.summaryDUPSSm} {input.summaryDUPSml} {input.summaryDUPMed} {input.summaryDUPLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} BND {output} A {input.summaryBND};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/SSm/Call/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Sml/Call/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Med/Call/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/DEL/Lrg/Call/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/SSm/Call/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Sml/Call/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Med/Call/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INS/Lrg/Call/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/SSm/Call/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Sml/Call/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Med/Call/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/INV/Lrg/Call/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-PAV",
               toolB="Sniffles-SVIM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-PAV",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="PAV-Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV-PAV",
               toolB="Sniffles-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_svim_asm_all:
        input:
                summaryDELSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/SSm/Call/FromTPCall/summary.txt"),
                summaryDELSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Sml/Call/FromTPCall/summary.txt"),
                summaryDELMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Med/Call/FromTPCall/summary.txt"),
                summaryDELLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/Lrg/Call/FromTPCall/summary.txt"),

                summaryINSSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/SSm/Call/FromTPCall/summary.txt"),
                summaryINSSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Sml/Call/FromTPCall/summary.txt"),
                summaryINSMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Med/Call/FromTPCall/summary.txt"),
                summaryINSLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/Lrg/Call/FromTPCall/summary.txt"),

                summaryINVSSm=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/SSm/Call/FromTPCall/summary.txt"),
                summaryINVSml=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Sml/Call/FromTPCall/summary.txt"),
                summaryINVMed=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Med/Call/FromTPCall/summary.txt"),
                summaryINVLrg=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/Lrg/Call/FromTPCall/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/All.calculated_rates.tsv")
        threads: 1
        benchmark:
                repeat(str(BENCH_DIR + "/Evaluation.benchmarking.tsv"), BENCH_REPEAT)
        params:
               toolA="CuteSV",
               toolB="PAV-Sniffles-SVIM-SVIM-ASM"
        shell:
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} DEL {output} W {input.summaryDELSSm} {input.summaryDELSml} {input.summaryDELMed} {input.summaryDELLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INS {output} A {input.summaryINSSSm} {input.summaryINSSml} {input.summaryINSMed} {input.summaryINSLrg};\n"
                "bash ./Scripts/calculate_iou_from_truvari_list.sh {params.toolA} {params.toolB} INV {output} A {input.summaryINVSSm} {input.summaryINVSml} {input.summaryINVMed} {input.summaryINVLrg};\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"
