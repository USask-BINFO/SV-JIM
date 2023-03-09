# SV-JIM

## Description
Multi-stage Snakemake pipeline that combines python and BASH scripts for Structural Variant (SV) calling with multiple third-party long-read and assembly alignment-based 
SV calling tools. In addition, this pipeline evaluates all SV results produced based on their consistency with other tools using the Jacccard index measure and Truvari. 
This workflow simplifies the generation of a comprehensive evidence-based SV result set and to aid SV studies that require well-supported SV results.

  - **Status**:  Version 1.0.2 - [CHANGELOG](CHANGELOG.md).

## Supported formats

SV-JIM requires genome assemblies from both a reference and query sample in FASTA format and a long-reads FASTQ file containing reads that belongs to query sample.
The input genome assembly files must be pre-downloaded by the user and the path information must be updated in the configuration file prior to execution. Similarly,
the read file can also be provided before execution; however, the pipeline also supports prefetching read data with SRATools based on the accession information added
to the config file.

After execution, SV-JIM produces multiple SV result files in Variant Call Format (VCF), including the original outputs, intersections for specific tool combinations, 
and aggregated SV results on the basis of minimum supporting callers (Ex: minTwo or minThree).
 
## Dependencies

SV-JIM is a Snakemake pipeline that utilizes multiple third party software tools. Many of these tools are installable as conda package so the pipeline includes
a conda configuration file for user convenience.

The full list of required software is provided below and includes version information for the software versions that were used during testing:

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

Additionally, the pipeline must be launched from an environment with Snakemake installed.

## Installation

As a Snakemake workflow that employs external tools, the installation only involves cloning this repository:

```
git clone https://github.com/CMalcolmTodd/SV-JIM
```

After cloning the SV-JIM repository, the conda dependencies will be loaded by Snakemake automatically during execution based on the included conda env configuration file.
For the remaining dependencies please consult the installation instructions provided by each tool's github/manual and ensure these tools are added to your PATH variable.

## Configuration

For configuration, SV-JIM provides a [config file template](config-SV-JIM.yaml) used by Snakemake to specify the required input files, conda environments, options, and 
directory information to enable execution. The provided template config file features many default values that utilize the provided working directory structure; 
however, these values are configurable if the preference is to use alternative directories. Further details on each of the available parameters is provided in later in this section.

Finally, SV-JIM includes a [conda environment file](All-Env.yaml) that permits Snakemake to install many of the pipeline's dependencies; however, the provided pipeline config file can also be 
updated to use alternative conda environment files if using separate conda environments with specific/non-conflicting software versions is required.

If an alternative conda environment is preferable, a conda environment file can be generated as follows:

```
conda env export -n <condaEnvName> -f <fileName>.yaml --from-history
```

Any additional conda files created must be placed in the `Rules` directory to allow for access by Snakemake during execution and please provide updated file name information for each tool's 
conda file in the pipeline's config file.

### Configuration file options:
#### Input File Configurations Section
##### Reference Sequence Information
 - `refSampleName`:  Short ID for user to distinguish files (EX: "NI100")
 - `refAssembly`: Path to Reference Fenome fasta file (EX: "./Genomes/Bnigra_NI100.fasta")
 - `refSeqsFile`: File of regions in the reference genome to include. For example, the chromosomes only. (EX:"./Genomes/RefSeqsToInclude.txt")
 	- Contents of the target file should contain one region per line. 
 	- This type of file can be created with:
		-  ```grep ">[Chrom_Prefix]" [genomeFasta] | tr -d ">" > [refSeqListFile]```

##### Query Sequence Information
 - `qrySampleName`:  Short ID for user to distinguish files (EX: "C2")
 - `qryAssembly`: Path to Reference Fenome fasta file (EX: "./Genomes/Bnigra_NI100.fasta")
 - `qrySeqsFile`: File of regions/contigs in the query assembly to be included. (EX:"./Genomes/QrySeqsToInclude.txt")
 	- Contents of the target file should contain one region per line. 
 	- This type of file can be created quickly with:
		- ```grep ">[Chrom_Prefix]" [genomeFasta] | tr -d ">" > [qrySeqListFile]```

##### Read Input Information
 - `accessionLR`: Accession number for Long-reads downloaded from SRA (EX: "SRR11906206")


#### Environment and Working Directory Configurations
##### Environment Information
- `threads`: Desired number of threads to use during execution based on hardware available (EX: 30)   

##### Working Directory Information 
Default options can be created easily using the 'build-workspace.sh' script provided in home directory of this repo.
 - `genomesFolder`: Path to target directory containing the reference and query fasta files. 
	- (EX: "./Genomes")
 - `longReadsFolder`: Path to target directory containing the long read data (in fastq) applicable to the query sample.
	- (EX: "./Long_Reads")
 - `qualimapReportsFolder`: Path to target directory into which Qualimap reports will be written. 
	- (EX: "./Qualimap_Reports")
 - `alignResultsFolder`: Path to target directory into which minimap2 alignment results will be written. 
	- (EX: "./Alignments")
 - `svResultsFolder`: Path to parent directory into which all SV caller results will be written. 
	- (EX: "./SV_Calls")
 - `intersectResultsFolder`: Path to parent directory into which all BEDTools intersect results will be written. 
	- (EX: "./Intersections")
 - `truvariResultsFolder`: Path to parent directory into which all Truvari bench results will be written. 
	- (EX:"./Truvari_Results")
 - `aggregatedResultsFolder`: Path to parent directory into which SV results supported by a minimum number of SV callers for each tool will be written. 
	- (EX:"./Aggregated_SV_Results")

##### Conda Environment Information 
This repo includes a YAML env file provided that contains all conda related dependency programs for user convenience. Additionally, using a single environment file with all
of the required software reduces pipeline execution time since snakemake will regenerate it's own copies of each environment automatically. 
However, the following separate options are available should the user require/prefer to use separate environments. Any YAML files to be used should be placed in the `Rules` subdirectory for Snakemake to access.

To use a single conda environment, please specify the same target YAML file for all five parameters. 
 - `cuteSVCondaEnvYAML`: Path to YAML file for conda env that CuteSV is installed in. (EX: "All-Env.yaml")
 - `sniffles2CondaEnvYAML`: Path to YAML file for conda env that Sniffles2 is installed in. (EX: "All-Env.yaml")
 - `svimCondaEnvYAML`: Path to YAML file for conda env that SVIM is installed in. (EX:"All-Env.yaml")
 - `svimASMCondaEnvYAML`: Path to YAML file for conda env that SVIM-ASM is installed in. (EX: "All-Env.yaml")
 - `pavCondaEnvYAML`: Path to YAML file for conda environment with PAV dependencies installed. (EX: "All-Env.yaml")

#### Software Configurations
##### SRATools Configurations 
For context, the default value provided is based on the  size of the read data files used during initial testing
 - `prefetchMaxSize`: Maximum file size that will downloaded during prefetch operation. (EX: "50G")

##### Minimap2 Aligner Configurations (for more details see minimap2 --help)
For context, the default settings taken from the supplementary information of the orginal [CuteSV](https://github.com/tjiangHIT/cuteSV) and [SVIM-ASM](https://github.com/eldariont/svim-asm) publications since these publications compared the performance of similar software that is used in the pipeline.
Additional details and options for each setting can also be found in the ```minimap2 --help``` menu.
 - `presetForLR`: Predefined settings based on sequencing tech. 
	- (EX: "map-ont" OR "map-pb" OR "map-hifi", etc.)
 - `presetForAssemblies`: Predefined settings for query assembly to ref alignment based on maximum allowable sequence divergence. 
	- (EX: asm5 OR asm10 OR asm20)
 - `minimapZDropForLR`: Z drop score and Inversion Z drop score parameter in minimap (EX: "600,200")


##### SAMTools Configurations
For context, these default settings were taken from the supplementary information from the original [SVIM-ASM](https://github.com/eldariont/svim-asm) publication since this parameter value was successfully used in their testing.
 - `memSettingForAssemblySort`: Memory required for sorting minimap2's assembly-to-ref alignment output. (EX: "4G")

##### General SV Caller Configurations 
For context, these default settings were taken from the supplementary information of the [CuteSV](https://github.com/tjiangHIT/cuteSV) publication since this publication demonstrated high quality performance rates when comparing the outputs of similar read-based SV Callers used in the pipeline.
 - `minMAPQForSVs`: PHRED-scaled quality score for the probability of error for an aligned base (EX: 20)
	- PHRED scores typically range from 4-60 with 10 representing 10% error, 20 representing 1%, 30 representing 0.1%, and 40 representing 0.01%
	- Additional details on PHRED-scaled quality scores can be found in the [Phred-scaled quality scores](https://gatk.broadinstitute.org/hc/en-us/articles/360035531872-Phred-scaled-quality-scores) article.
 - `minSuppReadsForSVs`: Min number of reads that support/indicate the presence of an SV. (EX: 10)
 - `minSizeForSVs`: Min size of SVs to be detected [50 is the common definition in literature]. (EX: 50)
 - `maxSizeForSVs`: Filtering maximum size for SV detectable by tools (EX: 300000)

##### CuteSV Configurations
As with the general SV configurations above, the default settings are taken from the CuteSV publication. Please see the [CuteSV repo](https://github.com/tjiangHIT/cuteSV) for more details on the significance of these settings.
 - `maxClusterBias`: 100
 - `diffRatio`: 0.3

##### Truvari Bench Configurations 
Default settings inspired by thresholds used in published literature and in the [SVIM-ASM](https://github.com/eldariont/svim-asm) publications' supplementary information. See ```truvari bench --help``` menu for more details on settings.
 - `overlapThreshold`: Rate of similarity required in the sizes of the SVs locations being compared. (EX: 0.5 [or 50% which is a commonly used threshold in literature])
 - `maxRefDistance`: Maximum distance (in number of bases) permitted when comparing the reference sequence index reported for the SV locations being compared (EX: 1000) 


## Usage

#### A) Set Up/Pre-work

 1. Update the provided SV-JIM config file to reflect the target input sequence information and update any setting values you wish to change from the defaults
 2. Create the files for the `refSeqsFile` and `qrySeqsFile` to specify only the target genome/assembly chroms/contigs to be considered during the pipeline's execution
	- See `grep` command suggestion in the Configuration section above for assistance 
 3. Note: If the input read files cannot/won't be fetched from SRA, please ensure the read's fastq file is unzipped and is named '<LR Accession>.fastq' consistent with the value provided in the config file to ensure 
Snakemake will not make an attempt to prefetch them unnecessarily.

#### B) Perform a dry run:

Recommended first step to confirm configuration/settings prior to executions.
Performing a dry run (-np) Builds the directed acyclic graph representing the outstanding tasks of the workflow and prints the applicable commands to be run at
each stage of pipeline to allow for review, but doesn't execute any of the related commands. 
Dry runs are also useful as they can identify errors that may occur based on current configurations and pre-work completed.

 1. cd to SV-JIM home directory
 2. Update configuration file to reflect inputs to be processed
 3. Run: ```snakemake -np```

#### C) Execute SV-JIM once configuration is prepared: 

Builds the directed acyclic graph representing the outstanding tasks of the workflow and begins execution of the underlying software. Note: the order of execution
for the outstanding tasks can vary between executions.

 1. cd to SV-JIM home directory
 2. Run: ```snakemake --use-conda --cores <# threads>```

Note:
 - Adding `--rerun-incompletes` to the command may be necessary if the pipeline terminates unexpectedly during execution to restart tasks that were in progress at the time.
 - Unexpected termination may also result in a locked working directory; however, this lock can be removed by either running ```snakemake --unlock``` in the SV-JIM home directory
 or by deleting the contents of the `<PAV_Directory>/.snakemake/locks/` directory if the reported lock was applied by PAV's Snakemake pipeline.

## Pipeline Test Example (Arabidopsis thaliana)

#### Input data
Due to it'ds size, the experiment's input sequence data should be obtained from the publicly accessible resources below:
 - Reference Genome: TAIR10
	- Available through the NCBI's RefSeq Genomes FTP server
	- DB Path: [/genomes/refseq/plant/Arabidopsis_thaliana/reference](https://ftp.ncbi.nlm.nih.gov/genomes/refseq/plant/Arabidopsis_thaliana/reference/)
 - Query Assembly: Ler
	- Available through 1001 Genomes Data center
	- Path: [data/MPIPZ/MPIPZJiao2020/releases/current/strains/Ler/](https://1001genomes.org/data/MPIPZ/MPIPZJiao2020/releases/current/strains/Ler/)
 - Query Read Data: PRJEB31147 
	- Available through ENA
	- Run Accession: ERR3415826 [FTP Download link](ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR341/006/ERR3415826/ERR3415826_subreads.fastq.gz)

#### Experiment set up
The provided config file should already contain many of the necessary configurations, but please make the following updates:

 1. Update the chromosome headewr information in the TAIR10 reference genome to be more concise/clear within the output and to match the Ler chrom IDs 
	- Ex: change longer chromosome 1 header in TAIR10 to '>chr1` (repeat all chromosomes by searching for '>' characters that begin each header)
 2. Generate a `RefSeqsToInclude.txt` and `QrySeqsToInclude.txt` using the grep instructions in the Config section to identify the sequences to be included from both genomes.
 3. Unzip and rename the downloaded ERR3415826 reads FASTQ file to ERR3415826.fastq to be consistent with the config file value provided. 
 4. Update provided config file's `refAssembly`, `refSeqsFile`, `qryAssembly`, and `qrySeqsFile` values to reflect the user's local path information for where the input data files are stored

#### Running the experiment
Once configured the pipeline can be executed similar to the usage instructions above:

 1. Run: ```snakemake --use-conda --cores <# threads>``` 

## Known issues

List of current issues

## Getting help

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker or e-mail `malcolm.todd@usask.ca`.

## Future work

Have suggestions on how the software can be improved? Please contact `malcolm.todd@usask.ca` with your suggestions/recommendations!

Current worklist:
 - Update Rules and Scripts to use zipped data inputs to improve memory footprint
 - Research parallelization options/caps for each tool and refine threads argument for each rule
 - Add Docstrings to Snakemake Rules files to improve internal documentation for users

----

## MIT licensing info
 1. [LICENSE](LICENSE)

----
