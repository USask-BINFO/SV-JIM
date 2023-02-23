configfile: "./config-SV-JIM.yaml"

#Identify Long Read Input Directories and Prefixes for Rules
LR_DIR=config["longReadsFolder"]
LR_ACCESSION=config["accessionLR"]
LR_PREFIX=str(LR_DIR + "/" + LR_ACCESSION)

#Identify Reference and Assembly Input Directories and Prefixes for Rules
GENOME_DIR=config["genomesFolder"]
REF_SAMP_NAME=config["refSampleName"]
REF_PREFIX=str(GENOME_DIR + "/" + REF_SAMP_NAME)
REF_FILTERED=str(REF_PREFIX + ".filtered.fasta")
QRY_SAMP_NAME=config["qrySampleName"]
QRY_PREFIX=str(GENOME_DIR + "/" + QRY_SAMP_NAME)
QRY_FILTERED=str(QRY_PREFIX + ".filtered.fasta")

#Identify Alignment Output Directories and Prefixes for Rules
ALIGN_DIR=config["alignResultsFolder"]
MNMP2_READS_PREFIX=str(ALIGN_DIR+ "/" + REF_SAMP_NAME + ".minimap2")
MNMP2_GENOMES_PREFIX=str(ALIGN_DIR+ "/" + REF_SAMP_NAME + "-" + QRY_SAMP_NAME +".minimap2")
QUALIMAP_OUTDIR=config["qualimapReportsFolder"]

#Identify VCF Result Output Directories and Prefixes for Rules
SV_RESULTS_DIR=config["svResultsFolder"]
CUTESV_PREFIX=str(SV_RESULTS_DIR + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV")
SNIFFLES_PREFIX=str(SV_RESULTS_DIR + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2")
SVIM_PREFIX=str(SV_RESULTS_DIR + "/SVIM/" + REF_SAMP_NAME + ".svim")
SVIM_ASM_PREFIX=str(SV_RESULTS_DIR + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm")
PAV_PREFIX=str(SV_RESULTS_DIR + "/PAV/" + REF_SAMP_NAME + ".pav")

#Incorporate Subrule files to be executed within this pipeline
include: "./Rules/filter_genomes.smk"
include: "./Rules/prefetch_sequences.smk"

include: "./Rules/align_files_w_minimap2.smk"
include: "./Rules/sort_alignment_files.smk"

include: "./Rules/long_read_sv_calling.smk"
include: "./Rules/assembly_based_sv_calling.smk"
include: "./Rules/verify_sv_filtering.smk"
include: "./Rules/segment_sv_by_type.smk"

include: "./Rules/intersect_sv_files.smk"
include: "./Rules/truvari_bench_sv_files.smk"
include: "./Rules/summarize_tool_evaluation_rates.smk"

#Default rule containing final output file targets to ensure executiong of entire pipeline
rule all:
        input:
                str(config["truvariResultsFolder"] + "/Sniffles-SVIM/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-CuteSV/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-CuteSV/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-ASM-CuteSV/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-ASM-Sniffles/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/SVIM-ASM-SVIM/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-CuteSV/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-Sniffles/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/All-Read-Callers/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/Sniffles-CuteSV-SVIM-ASM-SVIM/calculated_rates.tsv"),
                str(config["truvariResultsFolder"] + "/All-Callers/calculated_rates.tsv")
