rule combine_all_callers_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/INV"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_pav_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-PAV"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-PAV/INV"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/DEL"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INS"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/INV"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/INV"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_pav_sniffles_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/PAV-Sniffles"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/DEL"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INS"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/INV"),
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_sniffles_svim_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/DUP"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/INV"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_all_read_callers_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DEL"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INS"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/DUP"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/INV"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"

rule combine_cuteSV_svim_asm_types_to_all_directory:
        input:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DEL/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INS/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/DUP/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/INV/summary.txt"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/BND/summary.txt")
        output:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM"),
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
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM"),
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
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM"),
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
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-SVIM"),
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
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/CuteSV-Sniffles"),
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
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/tp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/fp.sorted.vcf"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/ALL/fn.sorted.vcf")
        threads: 1
        params:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DEL"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INS"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/DUP"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/INV"),
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/BND")
        shell:
                "bash ./Scripts/combine_vcf_files_basic.sh {params}"
