#!/bin/bash

# Create directories for each effector
# Get reads that are similar to effector sequences

WDIR=`pwd`
for EFF in *.fa
do
	NAME=`echo $EFF| sed 's,\.fa$,,'`
	mkdir "$NAME"; cd "$NAME"
	cp ../"$EFF" .
	
	mirabait -t fastq -k 31 -n 2 -i "$EFF" /scratch/workspace2/data/fwd.paired.9gb-10249472_81PWHABXX_s_6.trim28.cor.quake.fastq fwd.${NAME}.baitk31n2.txt
	mirabait -t fastq -k 31 -n 2 -i "$EFF" /scratch/workspace2/data/rev.paired.9gb-10249472_81PWHABXX_s_6.trim28.cor.quake.fastq rev.${NAME}.baitk31n2.txt
	
	cd "$WDIR"
done



