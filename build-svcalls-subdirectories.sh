#!/bin/bash

SV_RESULTS=$1

#Build SV Result Subfolders
echo "Building SV result subdirectories for each SV caller!.."
mkdir $SV_RESULTS/CuteSV
mkdir $SV_RESULTS/Sniffles
mkdir $SV_RESULTS/SVIM
mkdir $SV_RESULTS/SVIM-ASM
mkdir $SV_RESULTS/PAV

#Add required config files to PAV for user to fill out later
echo "NAME      HAP1    HAP2" > $SV_RESULTS/PAV/assemblies.tsv
echo "{" > $SV_RESULTS/PAV/config.json; echo "  reference: \"\"" >> $SV_RESULTS/PAV/config.json; echo "}" >> $SV_RESULTS/PAV/config.json

echo "Work complete!.."
