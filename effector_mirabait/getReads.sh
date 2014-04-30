#!/bin/bash
# Surya Saha
# Plant Path @Cornell / SOL Genomics
# Create directories for each effector
# Get reads that are similar to effector sequences

set -o nounset
set -o errexit

WDIR=`pwd`
for EFF in *.fa
do
	NAME=`echo $EFF| sed 's,\.fa$,,'`
	mkdir "$NAME"; cd "$NAME"
	cp ../"$EFF" .
	
	mirabait -t fastq -k 31 -n 1 "$EFF" /scratch/workspace2/data/fwd.paired.9gb-10249472_81PWHABXX_s_6.trim28.cor.quake.fastq fwd.${NAME}.baitk31n1.txt
	mirabait -t fastq -k 31 -n 1 "$EFF" /scratch/workspace2/data/rev.paired.9gb-10249472_81PWHABXX_s_6.trim28.cor.quake.fastq rev.${NAME}.baitk31n1.txt
	
	cd "$WDIR"
done



