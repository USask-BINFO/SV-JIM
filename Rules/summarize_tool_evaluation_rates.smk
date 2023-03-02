rule evaluate_sniffles_w_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="Sniffles2",
               toolB="SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_w_cuteSV:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="Sniffles2",
               toolB="CuteSV"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_w_cuteSV:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-CuteSV/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="SVIM",
               toolB="CuteSV"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_asm_w_cuteSV:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="SVIM-ASM",
               toolB="CuteSV"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_asm_w_sniffles:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="SVIM-ASM",
               toolB="Sniffles2"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_asm_w_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="SVIM-ASM",
               toolB="SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_cuteSV:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/PAV-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-CuteSV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-CuteSV/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-CuteSV/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-CuteSV/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="PAV",
               toolB="CuteSV"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_sniffles:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="PAV",
               toolB="Sniffles"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="PAV",
               toolB="SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_w_svim_asm:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="PAV",
               toolB="SVIM-ASM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_cuteSV_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/All-Read-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/All-Read-Callers/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/All-Read-Callers/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/All-Read-Callers/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/All-Read-Callers/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/All-Read-Callers/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/All-Read-Callers/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="SVIM",
               toolB="Sniffles-CuteSV"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_cuteSV_svim_asm_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="Sniffles-CuteSV",
               toolB="SVIM-ASM-SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_pav_sniffles_cuteSV_svim_asm_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/All-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/All-Callers/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/All-Callers/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/All-Callers/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/All-Callers/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="PAV",
               toolB="Sniffles-CuteSV-SVIM-ASM-SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"
