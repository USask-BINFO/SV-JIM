#!/bin/bash

TRUVARI_RESULTS=$1

#Build Truvari Subfolders
echo "Building Truvari result set subdirectories!.."
mkdir $TRUVARI_RESULTS/Sniffles-SVIM
mkdir $TRUVARI_RESULTS/Sniffles-CuteSV
mkdir $TRUVARI_RESULTS/SVIM-CuteSV
mkdir $TRUVARI_RESULTS/SVIM-ASM-CuteSV
mkdir $TRUVARI_RESULTS/SVIM-ASM-Sniffles
mkdir $TRUVARI_RESULTS/SVIM-ASM-SVIM
mkdir $TRUVARI_RESULTS/PAV-CuteSV
mkdir $TRUVARI_RESULTS/PAV-Sniffles
mkdir $TRUVARI_RESULTS/PAV-SVIM
mkdir $TRUVARI_RESULTS/PAV-SVIM-ASM
mkdir $TRUVARI_RESULTS/All-Read-Callers
mkdir $TRUVARI_RESULTS/Sniffles-CuteSV-SVIM-ASM-SVIM
mkdir $TRUVARI_RESULTS/All-Callers

echo "Work complete!.."
