#!/bin/bash
#
#$ -N Edwin_Job
#$ -t 1-150
#$ -q free64,pub64
### -m beas
### -M solarese@uci.edu
### -o
### -e
#$ -pe openmp 2  ##how many parallel environments to run and in what env i.e. openmp or mpi

JOBFILE="/home/data/solarese/dspr/jobfile.txt"
SEEDDIR="/home/data/solarese/dspr/RNAseq_data/"
OUTDIR="/home/data/solarese/dspr/outputs/bt2/"
IDXDIR="/home/data/solarese/dspr/drosophila_ref2/"

SEED=$(cat $JOBFILE | head -n $SGE_TASK_ID | tail -n 1)

#BOWTIE_OPTS=" -S "

BTRUN="bowtie2 -x "${IDXDIR}"d_melanogaster_ffb5_22 "${SEEDDIR}${SEED}" -S "${OUTDIR}$(basename ${SEED} .txt)".sam"
$BTRUN
