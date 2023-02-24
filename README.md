# SV-JIM

## Description
Multi-stage SnakeMake pipeline/workflow using python and BASH scripts for Structural Variant (SV) calling with multiple third-party long-read and assembly alignment-based 
SV calling tools. Further, this pipeline performs evaluation of all SV results produced based on consensus between tool output using both the Jacccard index measure and Truvari. 
This workflow produces a comprehensive evidence-based SV result set to aid SV studies that require well-supported results.

  - **Status**:  Version 1.0.2 - [CHANGELOG](CHANGELOG.md).
  - Describe what sets this apart from related-projects. Linking to another doc or page is OK if this can't be expressed in a sentence or two.

## Supported formats

SV-JIM requires genome assemblies for a reference and query sample in FASTA format and a set of long-reads from the query sample in FASTQ format.
The input genome assembly files must be pre-downloaded by the user and either placed in the `Workflow/Genomes/` folder in the provided workflow directories
or the path information for there location must be updated in the configuration file prior to execution.

After execution, SV-JIM produces multiple SV result files in Variant Call Format (VCF)

Similarly, the read data can be downloaded in advance and placed in the `Workflow_Outputs/Long_Reads` directory; however, SV-JIM can also execute an SRA Tools prefetch
command if provided with only the long-read data's accession number from NCBI.

## Dependencies

SV-JIM is a SnakeMake pipeline that utilizes multiple third party software tools. Many of these tools are installable as conda package so the pipeline includes a conda configuration file for user convenience.
The full list of required software is provided below and includes version information for software versions used during testing:

#### Dependencies installed through the provided conda configuration file

  - biopython 		(1.80)
  - cutesv 		(2.0.2)
  - svim 		(1.4.2)
  - svim-asm 		(1.0.3)
  - intervaltree	(3.0.2)
  - scipy		(1.10.0)
  - mamba		(1.2.0)
  - numpy		(1.24.2)
  - snakemake		(7.21.0)
  - pysam		(0.20.0)
  - sniffles=2.0	(2.0.7)
  - pandas		(1.5.3)
  - matplotlib		(3.6.3)
  - matplotlib-venn	(0.11.7)
  - truvari		(3.5.0)

#### Other dependencies

  - SRA-Tools 		(3.0.2)
  - Minimap2		(2.24-r1122)
  - SAMTools		(1.16.1)
  - BCFTools		(1.16)
  - BEDTools		(2.30.0)
  - PAV			(2.2.1)

Describe any dependencies that must be installed for this software to work.
This includes programming languages, databases or other storage mechanisms, build tools, frameworks, and so forth.
If specific versions of other software are required, or known not to work, call that out.

## Installation

As a SnakeMake workflow that employs external tools, the installation only involves cloning this repository:

```
git clone https://github.com/CMalcolmTodd/SV-JIM
```

After cloning the SV-JIM repository, the conda dependencies will be loaded by SnakeMake automatically during execution using the included conda env configuration file.
For the remaining dependencies please consult the installation instructions provided by each tool's github/manual
 and ensure these tools are added to your PATH variable.

## Configuration

For configuration, SV-JIM provides a [config file template](config-SV-JIM.yaml) used by SnakeMake to specify the required input files, conda environments, options, and directory information to enable execution.
The template config file provided within this repo features many default values that utilize the provided working directory structure; 
however, these values are configurable if the preference is to use alternative directories. 
Additional details on each of the available parameters is provided in later in this section.

Finally, SV-JIM includes a [conda config file](All-Env.yaml) that can be used to have SnakeMake install many of the pipeline's dependencies; however, the provided SnakeMake config file can also be 
updated to use alternative existing conda environment files if using separate conda environments with specific (or conflicting) software versions is preferred. 

These conda configuration files can be generated as follows:

```
conda env export -n <condaEnvName> -f <fileName>.yaml --from-history
```

Any additional conda files created must be placed in the `Rules` directory to allow for access by SnakeMake during execution and please provide updated file name information for each tool's 
conda file in the SV-JIM config file provided.

### Configuration file options:
#### Input File Configurations Section
##### Reference Sequence Information
 - refSampleName:  Short ID for user to distinguish files (EX: "NI100")
 - refAssembly: Path to Reference Fenome fasta file (EX: "./Genomes/Bnigra_NI100.fasta")
 - refSeqsFile: File of regions in the reference genome to include. For example, the chromosomes only. (EX:"./Genomes/RefSeqsToInclude.txt")
 	- Contents of the target file should contain one region per line. 
 	- This type of file can be created with ```grep ">[Chrom_Prefix]" [genomeFasta] | tr -d ">" > [refSeqListFile]```

##### Query Sequence Information
 - qrySampleName:  Short ID for user to distinguish files (EX: "C2")
 - qryAssembly: Path to Reference Fenome fasta file (EX: "./Genomes/Bnigra_NI100.fasta")
 - qrySeqsFile: File of regions/contigs in the query assembly to be included. (EX:"./Genomes/QrySeqsToInclude.txt")
 	- Contents of the target file should contain one region per line. 
 	- This type of file can be created quickly with ```grep ">[Chrom_Prefix]" [genomeFasta] | tr -d ">" > [qrySeqListFile]```

##### Read Input Information
 - accessionLR: Accession number for Long-reads downloaded from SRA (EX: "SRR11906206")


#### Environment and Working Directory Configurations
##### Environment Information
- threads: Desired number of threads to use during execution based on hardware available (EX: 30)   

##### Working Directory Information 
Default options can be created easily using the 'build-workspace.sh' script provided in home directory of this repo.
 - genomesFolder: Path information for the target directory containing the reference and query fasta files. (EX: "./Genomes")
 - longReadsFolder: Path information for the target directory containing the long read data (in fastq) applicable to the query sample. (EX: "./Long_Reads")
 - qualimapReportsFolder: Path information for the target directory into which Qualimap reports will be written. (EX: "./Qualimap_Reports")
 - alignResultsFolder: Path information for the target directory into which minimap2 alignment results will be written. (EX: "./Alignments")
 - svResultsFolder: Path information for the target parent directory into which all SV caller results will be written. (EX: "./SV_Calls")
 - intersectResultsFolder: Path information for the target parent directory into which all BEDTools intersect results will be written. (EX: "./Intersections")
 - truvariResultsFolder: Path information for the target parent directory into which all Truvari bench results will be written. (EX:"./Truvari_Results")

##### Conda Environment Information 
This repo includes a default YAML env file provided that contains all conda related programs as dependencies for use convenience. Additionally, using only a single YAML file featuring all of the required software reduces pipeline execution time since snakemake will regenerate it's own copies of each environment automatically. However, the following seperate options are available should the user require/prefer to use separate environments. Any YAML files to be used should be placed in the Rules subdirectory for SnakeMake to access.
To use a single conda, please specify the same target YAML file for all five parameters. 
- cuteSVCondaEnvYAML: Path to YAML file for conda env that CuteSV is installed in. (EX: "All-Env.yaml")
- sniffles2CondaEnvYAML: Path to YAML file for conda env that Sniffles2 is installed in. (EX: "All-Env.yaml")
- svimCondaEnvYAML: Path to YAML file for conda env that SVIM is installed in. (EX:"All-Env.yaml")
- svimASMCondaEnvYAML: Path to YAML file for conda env that SVIM-ASM is installed in. (EX: "All-Env.yaml")
 - pavCondaEnvYAML: Path to YAML file for conda environment that PAV dependencies are installed in. (EX: "All-Env.yaml")

#### Software Configurations
##### SRATools Configurations 
For context, the default value provided is based on the  size of the read data files used during initial testing
- prefetchMaxSize: Maximum file size that will downloaded during prefetch operation. (EX: "50G")

##### Minimap2 Aligner Configurations (for more details see minimap2 --help)
For context, the default settings taken from the supplementary information of the orginal [CuteSV](https://github.com/tjiangHIT/cuteSV) and [SVIM-ASM](https://github.com/eldariont/svim-asm) publications since these publications compared the performance of similar software that is used in the pipeline.
Additional details and options for each setting can also be found in the ```minimap2 --help``` menu.
- presetForLR: Predefined settings based on sequencing tech. (EX: "map-ont" OR "map-pb" OR "map-hifi", etc.)
- presetForAssemblies: Predefined settings for query assembly to ref alignment based on maximum allowable sequence divergence. (EX: asm5 OR asm10 OR asm20)
- minimapZDropForLR: Z drop score and Inversion Z drop score parameter in minimap (EX: "600,200")

##### SAMTools Configurations
For context, these default settings were taken from the supplementary information from the original [SVIM-ASM](https://github.com/eldariont/svim-asm) publication as this parameter value was successfully used in their testing.
- memSettingForAssemblySort: Requested/Required memory amount when sorting minimap2's assembly-to-ref alignment output. (EX: "4G")

##### General SV Caller Configurations 
For context, these default settings were taken from the supplementary information of the [CuteSV](https://github.com/tjiangHIT/cuteSV) publication since this publication demonstrated high quality performance rates when comparing the outputs of similar read-based SV Callers used in the pipeline.
- minMAPQForSVs: PHRED-scaled quality score that relates to the probability of error for an aligned base (EX: 20)
	- PHRED scores typically range from 4-60 with 10 representing 10% error, 20 representing 1%, 30 representing 0.1%, and 40 representing 0.01%
	- Additional details on PHRED-scaled quality scores can be found in the [Phred-scaled quality scores](https://gatk.broadinstitute.org/hc/en-us/articles/360035531872-Phred-scaled-quality-scores) article.
- minSuppReadsForSVs: Evidence threshold for the number of reads that support/indicate the presence of an SV. (EX: 10)
- minSizeForSVs: Filtering for min size of the SV to be detected with 50 being the common definition for SV min size in literature. (EX: 50)
- maxSizeForSVs: Filtering maximum size for SV detectable by tools (EX: 300000)

##### CuteSV Configurations
As with the general SV configurations above, the default settings are taken from the CuteSV publication. Please see the [CuteSV repo](https://github.com/tjiangHIT/cuteSV) for more details on the significance of these settings.
- maxClusterBias: 100
- diffRatio: 0.3

##### Truvari Bench Configurations 
Default settings inspired by thresholds used in published literature and in the [SVIM-ASM](https://github.com/eldariont/svim-asm) publications' supplementary information. See ```truvari bench --help``` menu for more details on settings.
- overlapThreshold: Rate of similarity required in the sizes of the SVs locations being compared. (EX: 0.5 [or 50% which is a commonly used threshold in literature])
- maxRefDistance: Maximum distance (in number of bases) permitted when comparing the reference sequence index reported for the SV locations being compared (EX: 1000) 


## Usage

#### 1) Set Up/Pre-work

A) If executing the pipeline using the default working directory, the please run the `build-workspace.sh` script provided in the home direcotry of repo to easily the required directories featured in the template config file provided.
B) Update the provided SV-JIM config file for any non-default values you wish to change
C) Ensure the target reference genome and query assembly fasta files (or copies) are located in the directory identified in the `genomesFolder` parameter within the config file.
D) Create the files for the `refSeqsFile` and `qrySeqsFile` containing the target genome/assembly regions to be considered during the pipeline's execution
	- See `grep` command suggestion in the Configuration section above for assistance 
E) If altering the pipeline's target output directories, please ensure the necessary subdirectories are created for the updated `svResultsFolder` `intersectResultsFolder` `truvariResultsFolder` targets 
	- To build the `svResultsFolder`'s subdirectories, please run the `build_svcalls_subdirectories.sh` scipt and provide the alternate directory as an argument (EX: build_svcalls_subdirectories.sh [newTargetDir])
        - To build the `intersectResultsFolder`'s subdirectories, please run the `build_intersections_subdirectories.sh` scipt and provide the alternate directory as an argument (EX: build_intersections_subdirectories.sh [newTargetDir])
        - To build the `truvariResultsFolder`'s subdirectories, please run the `build_truvari_subdirectories.sh` scipt and provide the alternate directory as an argument (EX: build_truvari_subdirectories.sh [newTargetDir]) 
F) `cd` to the target PAV output directory and add/update the `config.json` and `assemblies.tsv` required by PAV (see [Configuring PAV](https://github.com/EichlerLab/pav#configuring-pav) for more details) 

#### 2) Perform a dry run:

Recommended first step to confirm configuration/settings prior to executions.
Performing a dry run (-np) Builds the directed acyclic graph representing the outstanding tasks of the workflow and prints the applicable commands to be run at
each stage of pipeline to allow for review, but doesn't execute any of the related commands. 
Dry runs are also useful as they can identify errors that may occur based on current configurations and pre-work completed.

A) Edit configuration file to inputs to be processed
B) cd to SV-JIM home directory
C) Run: ```snakemake -np```

#### 3) Execute SV-JIM once configuration is prepared: 

Builds the directed acyclic graph representing the outstanding tasks of the workflow and begins execution of the underlying software. Note: the order of execution
for the outstanding tasks can vary between executions.

A) cd to SV-JIM home directory
B) Run: ```snakemake --use-conda --cores <# threads>```

Note:
 - Adding `--rerun-incompletes` to the command may be necessary if the pipeline terminates unexpectedly during execution to restart tasks that were in progress at the time.
 - Unexpected termination may also result in a locked working directory; however, this lock can be removed by either running ```snakemake --unlock``` in the SV-JIM home directory
 or by deleting the contents of the `<PAV_Directory>/.snakemake/locks/` directory if the reported lock was applied by PAV's SnakeMake pipeline.

## Pipeline Test Example (Arabidopsis thaliana)

#### Input data
If the software includes automated tests, detail how to run those tests.

## Known issues

List of current issues

## Getting help

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker or e-mail `malcolm.todd@usask.ca`.

## Future work

Have suggestions on how the software can be improved? Please contact `malcolm.todd@usask.ca` with your suggestions/recommendations!

Current worklist:
- Add Docstrings to SnakeMake Rules files to improve internal documentation for users
- Add additional tool combinations to interesect rules and incorporate them into the pipeline on completion
- Explore use of the union set and how best to aggregate truvari results back into singular SV files

----

## MIT licensing info
1. [LICENSE](LICENSE)

----

## Credits and references

1. Projects that inspired you
2. Related projects
3. Books, papers, talks, or other sources that have meaningful impact or influence on this project
