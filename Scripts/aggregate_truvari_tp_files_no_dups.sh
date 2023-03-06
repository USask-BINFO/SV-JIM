#!/bin/bash

SV_DIR=$1
shift #remove output file as first arg so remainder can be added to bcftools command (concats all files provided after output)
COMBO_EXTENT=$1
shift

TP_FILEs=""
for FILE in $*
do
	#bcftools sort -o $DIR/tp.sorted.vcf $DIR/tp.vcf
	bgzip -c $FILE > $FILE.gz
	tabix $FILE.gz
	TP_FILES="$FILE.gz $TP_FILES"
done

echo "Combining VCF files for each type to $OUTPUT_FILE!.."
bcftools concat --allow-overlaps --remove-duplicates -o $SV_DIR/tp.$COMBO_EXTENT.vcf -O v `echo $TP_FILES`
bcftools sort -o $SV_DIR/tp.$COMBO_EXTENT.sorted.vcf $SV_DIR/tp.$COMBO_EXTENT.vcf
echo "Job's done!.."
