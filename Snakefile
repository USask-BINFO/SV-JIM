configfile: "./config-SV-JIM.yaml"

#Identify Long Read Input Directories and Prefixes for Rules
LR_DIR=config["longReadsFolder"]
LR_ACCESSION=config["lastLRAccession"]
LR_PREFIX=str(LR_DIR + "/" + LR_ACCESSION)

#Identify Reference and Assembly Input Directories and Prefixes for Rules
GENOME_DIR=config["genomesFolder"]
REF_SAMP_NAME=config["refSampleName"]
REF_PREFIX=str(GENOME_DIR + "/" + REF_SAMP_NAME)
REF_FILE_EXTENSION=config["refFileExtension"]
REF_FILTERED=str(REF_PREFIX + ".filtered." + REF_FILE_EXTENSION)
QRY_SAMP_NAME=config["qrySampleName"]
QRY_PREFIX=str(GENOME_DIR + "/" + QRY_SAMP_NAME)
QRY_FILE_EXTENSION=config["qryFileExtension"]
QRY_FILTERED=str(QRY_PREFIX + ".filtered." + QRY_FILE_EXTENSION)

#Identify Alignment Output Directories and Prefixes for Rules
ALIGN_DIR=config["alignResultsFolder"]
MNMP2_READS_PREFIX=str(ALIGN_DIR+ "/" + REF_SAMP_NAME + ".minimap2")
MNMP2_GENOMES_PREFIX=str(ALIGN_DIR+ "/" + REF_SAMP_NAME + "-" + QRY_SAMP_NAME +".minimap2")
QUALIMAP_OUTDIR=config["qualimapReportsFolder"]

#Identify VCF Result Output Directories and Prefixes for Rules
SV_RESULTS_DIR=config["svResultsFolder"]
TOTALS_DIR=config["totalsFolder"]
CUTESV_PREFIX=str(SV_RESULTS_DIR + "/CuteSV/" + REF_SAMP_NAME + ".cuteSV")
SNIFFLES_PREFIX=str(SV_RESULTS_DIR + "/Sniffles/" + REF_SAMP_NAME + ".sniffles2")
SVIM_PREFIX=str(SV_RESULTS_DIR + "/SVIM/" + REF_SAMP_NAME + ".svim")
SVIM_ASM_PREFIX=str(SV_RESULTS_DIR + "/SVIM-ASM/" + REF_SAMP_NAME + ".svim-asm")
PAV_PREFIX=str(SV_RESULTS_DIR + "/PAV/" + REF_SAMP_NAME + ".pav")

#Identify Benchmarking Result Output Directory and Repeat Frequency for Rules
BENCH_DIR=config["benchmarkDir"]
BENCH_REPEAT=config["repeatsForBench"]

#Incorporate Subrule files to be executed within this pipeline
include: "./Rules/filter_genomes.smk"
#include: "./Rules/prefetch_sequences.smk"

include: "./Rules/align_files_w_minimap2.smk"
include: "./Rules/sort_alignment_files.smk"

include: "./Rules/long_read_sv_calling.smk"
include: "./Rules/assembly_based_sv_calling.smk"
include: "./Rules/verify_sv_filtering.smk"
include: "./Rules/segment_sv_by_type_and_size.smk"

#include: "./Rules/intersect_sv_files.smk"
include: "./Rules/truvari_bench_sv_files_ssm.smk"
include: "./Rules/truvari_bench_sv_files_sml.smk"
include: "./Rules/truvari_bench_sv_files_med.smk"
include: "./Rules/truvari_bench_sv_files_lrg.smk"
include: "./Rules/combine_types_vcfs_to_all_ssm.smk"
include: "./Rules/combine_types_vcfs_to_all_sml.smk"
include: "./Rules/combine_types_vcfs_to_all_med.smk"
include: "./Rules/combine_types_vcfs_to_all_lrg.smk"
include: "./Rules/combine_sizes_vcfs_to_final.smk"

include: "./Rules/summarize_tool_evaluation_rates_ssm.smk"
include: "./Rules/summarize_tool_evaluation_rates_sml.smk"
include: "./Rules/summarize_tool_evaluation_rates_med.smk"
include: "./Rules/summarize_tool_evaluation_rates_lrg.smk"
include: "./Rules/summarize_tool_evaluation_rates_all.smk"

include: "./Rules/determine_sv_sets_min_callers.smk"
include: "./Rules/remove_duplicate_aggregate_file_entries.smk"
include: "./Rules/generate_final_result_counts.smk"

#Default rule containing final output file targets to ensure executiong of entire pipeline
rule all:
        input:
                #str(config["truvariResultsFolder"] + "/Sniffles-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-Sniffles/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/Sniffles-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-Sniffles/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/Sniffles-SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-Sniffles-SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/PAV-Sniffles-SVIM-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-ASM/calculated_rates.tsv"),
                #str(config["truvariResultsFolder"] + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM/calculated_rates.tsv"),
                str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minTwo.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minThree.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/CuteSV/tp.minFour.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/PAV/tp.minTwo.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/PAV/tp.minThree.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/PAV/tp.minFour.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minTwo.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minThree.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/Sniffles/tp.minFour.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/SVIM/tp.minTwo.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/SVIM/tp.minThree.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/SVIM/tp.minFour.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minTwo.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minThree.unique.sorted.vcf"),
                str(config["aggregatedResultsFolder"] + "/SVIM-ASM/tp.minFour.unique.sorted.vcf"),
                str(TOTALS_DIR + "/CuteSV.summary"),
                str(TOTALS_DIR + "/Sniffles.summary"),
                str(TOTALS_DIR + "/SVIM.summary"),
                str(TOTALS_DIR + "/SVIM-ASM.summary"),
                str(TOTALS_DIR + "/PAV.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV.summary"),
                str(TOTALS_DIR + "/CuteSV-Sniffles.summary"),
                str(TOTALS_DIR + "/CuteSV-SVIM.summary"),
                str(TOTALS_DIR + "/CuteSV-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/PAV-Sniffles.summary"),
                str(TOTALS_DIR + "/PAV-SVIM.summary"),
                str(TOTALS_DIR + "/PAV-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/Sniffles-SVIM.summary"),
                str(TOTALS_DIR + "/Sniffles-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-SVIM.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-Sniffles-SVIM.summary"),
                str(TOTALS_DIR + "/CuteSV-Sniffles-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/PAV-Sniffles-SVIM.summary"),
                str(TOTALS_DIR + "/PAV-Sniffles-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/PAV-SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/Sniffles-SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles-SVIM.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-Sniffles-SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/PAV-Sniffles-SVIM-SVIM-ASM.summary"),
                str(TOTALS_DIR + "/CuteSV-PAV-Sniffles-SVIM-SVIM-ASM.summary")
        benchmark: repeat(str(BENCH_DIR + "/allRule.benchmarking.tsv"), BENCH_REPEAT)
