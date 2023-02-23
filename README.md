#### CFPB Open Source Project Template Instructions

1. Create a new project.
2. [Copy these files into the new project](#installation)
3. Update the README, replacing the contents below as prescribed.
4. Add any libraries, assets, or hard dependencies whose source code will be included
   in the project's repository to the _Exceptions_ section in the [TERMS](TERMS.md).
  - If no exceptions are needed, remove that section from TERMS.
5. If working with an existing code base, answer the questions on the [open source checklist](opensource-checklist.md)
6. Delete these instructions and everything up to the _Project Title_ from the README.
7. Write some great software and tell people about it.

> Keep the README fresh! It's the first thing people see and will make the initial impression.

## Installation

To install all of the template files, run the following script from the root of your project's directory:

```
bash -c "$(curl -s https://raw.githubusercontent.com/CFPB/development/main/open-source-template.sh)"
```

----

# Note: this README reflects a work in progress and will be subject to multiple reworks in the short-term

# SV-JIM

**Description**:  
Multi-stage SnakeMake pipeline/workflow for Structural Variant (SV) calling using multiple long-read and assembly alignment-based 
SV calling tools with evaluation performed based on consensus using both the Jacccard index measure and Truvari. 
This workflow produces a comprehensive evidence-based SV result set to aid SV studies that 
require well-supported results.

Other things to include:

  - **Technology stack**: Indicate the technological nature of the software, including primary programming language(s) and whether the software is intended as standalone or as a module in a framework or other ecosystem.
  - **Status**:  Version 1.0.2 - [CHANGELOG](CHANGELOG.md).
  - **Links to production or demo instances**
  - Describe what sets this apart from related-projects. Linking to another doc or page is OK if this can't be expressed in a sentence or two.

## Supported formats

SV-JIM requires genome assemblies for a reference and query sample in FASTA format and a set of long-reads from the query sample in FASTQ format.
The input genome assembly files must be pre-downloaded by the user and either placed in the `./Genomes/` folder in the provided workflow directories
or the path information for there location must be updated in the configuration file prior to execution.

After execution, SV-JIM produces multiple SV result files in Variant Call Format (VCF)

Similarly, the read data can be downloaded in advance and placed in the `./Long_Reads/` directory; however, SV-JIM can also execute an SRA Tools prefetch
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
however, these values are entriely configurable if the preference is to use alternative directories. An example of a complete config file is provided below.

Alternatively, if the user prefers to provide their own configuration file rather than fill in the template, then the top most line of SV-JIM's provided Snakefile in the home directory
 can be updated with new path information for the preferred config file.

SV-JIM also executes PAV within the workflow (which consists of its own SnakeMake pipeline), so please place the required PAV configuration documents 
(Ex: `config.json` and `assemblies.tsv`) within the desired PAV working directory (Ex: `./SV_Calls/PAV/` by default).

Finally, SV-JIM includes a [conda config file](All-Env.yaml) that can be used to have SnakeMake install many of the pipeline's dependencies; however, the provided SnakeMake config file can also be 
updated to use alternative existing conda environment files if using separate conda environments with specific (or conflicting) software versions is preferred. 

These conda configuration files can be generated as follows:

```
conda env export -n <condaEnvName> -f <fileName>.yaml --from-history
```

Once the conda config files have been created, please provide updated path information for each tool's conda configuration file or leave the path as the default value otherwise.


#### Configuration file example:
```
threads: 20

refSampleName: "NI100"
refAssembly: "./Genomes/Bnigra_NI100.v2.genome.fasta"

qrySampleName: "C2"
qryAssembly: "./Genomes/Bnigra_C2.v1.genome.fasta"

accessionLR: "SRR11906206" #Accession number for Long-reads downloaded from SRA
seqTechForLR: "map-ont" # map-ont, map-bp

minMAPQForSVs: 20
minSuppReadsForSVs: 10
minSizeForSVs: 50
maxSizeForSVs: 300000
overlapThreshold: 0.5

mainCondaEnvYAML: "./Rules/All-Env.yaml"
cuteSVCondaEnvYAML: "./Rules/All-Env.yaml" #"CuteSV-Env.yaml"
sniffles2CondaEnvYAML: "./Rules/All-Env.yaml" #"Sniffles2-Env.yaml"
svimCondaEnvYAML: "./Rules/All-Env.yaml" #"SVIM-Env.yaml"
svimASMCondaEnvYAML: "./Rules/All-Env.yaml" #"SVIM-ASM-Env.yaml"
pavCondaEnvYAML: "./Rules/All-Env.yaml" #"PAV-Env.yaml"

genomesFolder: "./Genomes"
longReadsFolder: "./Long_Reads"
qualimapReportsFolder: "./Qualimap_Reports"
alignResultsFolder: "./Alignments"
svResultsFolder: "./SV_Calls"
intersectResultsFolder: "./Intersections"
truvariResultsFolder: "./Truvari_Results"
```
## Usage

#### To perform a dry run:

Recommended first step to confirm configuration/settings prior to executions.
Performing a dry run (-np) Builds the directed acyclic graph representing the outstanding tasks of the workflow and prints the applicable commands to be run at
each stage of pipeline to allow for review, but doesn't execute any of the related commands.

1) Edit configuration file to inputs to be processed
2) cd to SV-JIM home directory
3) Run: 
```
snakemake -np --use-conda --cores <# threads>
```

#### To execute SV-JIM once configuration is prepared: 

Builds the directed acyclic graph representing the outstanding tasks of the workflow and begins execution of the underlying software. Note: the order of execution
for the outstanding tasks can vary between executions.

1) cd to SV-JIM home directory
2) Run: 
```
snakemake --use-conda --cores <# threads>
```

## How to test the software

If the software includes automated tests, detail how to run those tests.

## Known issues

Document any known significant shortcomings with the software.

## Getting help

Instruct users how to get help with this software; this might include links to an issue tracker, wiki, mailing list, etc.

**Example**

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker.

## Getting involved

This section should detail why people should get involved and describe key areas you are
currently focusing on; e.g., trying to get feedback on features, fixing certain bugs, building
important pieces, etc.

General instructions on _how_ to contribute should be stated with a link to [CONTRIBUTING](CONTRIBUTING.md).


----

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)


----

## Credits and references

1. Projects that inspired you
2. Related projects
3. Books, papers, talks, or other sources that have meaningful impact or influence on this project
