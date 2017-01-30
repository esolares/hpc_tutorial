#!/bin/bash
module load java/jdk8u73
CANU="/home/solares/bin/canu/Linux-amd64/bin"
#CANU="/home/solares/bin/canu-1.4/Linux-amd64/bin"
PATH=$PATH:$CANU

INPUT="myasm.fastq"
PREFIX="myasm"
#GENOMESIZE="235m"
GENOMESIZE="250m"
SPECFILE="msnewspec.spec"
GRIDOPS="-p RM -t 12:00:00 --mem=120g --cpus-per-task=28"

canu -p ${PREFIX} -d ${PREFIX}-auto-${GENOMESIZE} genomeSize=${GENOMESIZE} -pacbio-raw ${INPUT} -s ${SPECFILE} gridOptions="${GRIDOPS}"
