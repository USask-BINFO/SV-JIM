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

rule evaluate_cuteSV_w_sniffles:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV",
               toolB="Sniffles2"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV",
               toolB="SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_svim_asm:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV",
               toolB="SVIM-ASM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_sniffles_w_svim_asm:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="Sniffles2",
               toolB="SVIM-ASM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_svim_w_svim_asm:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="SVIM",
               toolB="SVIM-ASM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_w_pav:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/PAV-CuteSV/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV",
               toolB="PAV"
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

rule evaluate_cuteSV_sniffles_svim:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/All-Read-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV",
               toolB="Sniffles-SVIM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_sniffles_svim_svim_asm:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                summaryDUP=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt"),
                summaryBND=str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV-Sniffles",
               toolB="SVIM-SVIM-ASM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DUP {input.summaryDUP} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} BND {input.summaryBND} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"

rule evaluate_cuteSV_pav_sniffles_svim_svim_asm:
        input:
                #summaryALL=str(config["truvariResultsFolder"] + "/All-Callers/ALL/summary.txt"),
                summaryDEL=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                summaryINS=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                summaryINV=str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/calculated_rates.tsv")
        threads: config["threads"]
        params:
               toolA="CuteSV",
               toolB="PAV-Sniffles-SVIM-SVIM-ASM"
        shell:
                #"bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} ALL {input.summaryALL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} DEL {input.summaryDEL} {output} W;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INS {input.summaryINS} {output} A;\n"
                "bash ./Scripts/calculate_iou_from_truvari_pair.sh {params.toolA} {params.toolB} INV {input.summaryINV} {output} A;\n"
                "bash ./Scripts/calculate_total_from_tsv.sh {output} {params.toolA} {params.toolB}"
