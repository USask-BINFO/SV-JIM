#!/bin/bash

INTERSECTIONS=$1

#Build Intersection Subfolders
echo "Building intersection set subdirectories!.."
mkdir $INTERSECTIONS/Sniffles-SVIM
mkdir $INTERSECTIONS/Sniffles-CuteSV
mkdir $INTERSECTIONS/SVIM-CuteSV
mkdir $INTERSECTIONS/SVIM-ASM-CuteSV
mkdir $INTERSECTIONS/SVIM-ASM-Sniffles
mkdir $INTERSECTIONS/SVIM-ASM-SVIM
mkdir $INTERSECTIONS/PAV-CuteSV
mkdir $INTERSECTIONS/PAV-Sniffles
mkdir $INTERSECTIONS/PAV-SVIM
mkdir $INTERSECTIONS/PAV-SVIM-ASM
mkdir $INTERSECTIONS/All-Read-Callers
mkdir $INTERSECTIONS/Sniffles-CuteSV-SVIM-ASM-SVIM
mkdir $INTERSECTIONS/All-Callers

echo "Work complete!.."
