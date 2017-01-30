#!/bin/bash
#
#$ -N simpleblasr
### -t 1-1
#$ -q bio,abio,free64,pub64
### -m beas
### -M solarese@uci.edu
### -o
### -e
#$ -pe openmp 32

module load blasr/20140724

OPTIONS="-minMatch 8 -maxMatch 15 -minPctIdentity 75 -bestn 1 -nCandidates 10 -maxScore -500 -nproc 32"
OUPUT="sdic_allowsplitbestn1"
OUT="sam"
QUERY="dro_pacb_sdic_filtered.fasta"
REFERENCE="dro_pacb_sdic_filtered.fasta"




blasr ${QUERY} ${REFERENCE} -sa ${REFERENCE}.sa ${OPTIONS} -${OUT} > ${OUTPUT}.${OUT}
#blasr dro_pacb_sdic_filtered.fasta dro_pacb_sdic_filtered.fasta -sa dro_pacb_sdic_filtered.fasta.sa -minMatch 8 -maxMatch 15 -minPctIdentity 75 -bestn 1 -nCandidates 10 -maxScore -500 -nproc 32 -sam > sdic_allowsplitbestn1.sam
