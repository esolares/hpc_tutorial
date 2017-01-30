#!/bin/bash
#SBATCH -J wildbgasm
#SBATCH -o wildbgasm.o%j
###SBATCH -N 1                 # Total number of nodes requested (16 cores/node)
#SBATCH -n 1                # Total number of mpi tasks requested
#SBATCH -p RM     # queue (partition) -- normal, development, largemem, etc.
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=solarese@uci.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes

module load blasr/1.3.1
PATH=$PATH:/home/solares/bin/DBG2OLC_PBDAGCON/

CONTIGFILE="willi_contig.fa"
#PACBIOREADS=""
#PACBIOREADS="dwillifastq_top30x.fastq"
PACBIOREADS="ReadsInfoFrom_dwillifastq_top30x.fastq"
BACKBONERAWFA="backbone_raw.fasta"
DBG2OLCCONS="DBG2OLC_Consensus_info.txt"


###overlap
###using contig file as input example
#DBG2OLC k KmerSize AdaptiveTh THRESH_VALUE1 KmerCovTh THRESH_VALUE2 MinOverlap THRESH_VALUE3 \
#   Contigs NGS_CONTIG_FILE \
#   f LONG_READS.FASTA RemoveChimera 1

###parameter tuning
##For 10x/20x PacBio data:
#KmerCovTh 2-5, MinOverlap 10-30, AdaptiveTh 0.001~0.01
##For 50x-100x PacBio data:
#KmerCovTh 2-10, MinOverlap 50-150, AdaptiveTh 0.01-0.02

DBG2OLC k 17 AdaptiveTh 0.001 KmerCovTh 2 MinOverlap 10 RemoveChimera 1 \
   Contigs ${CONTIGFILE} \
   f ${PACBIOREADS}

###consensus
#check n50 of backbone file first; proceed if ok
#concat pbreads and contigs
cat ${CONTIGFILE} ${PACBIOREADS} > ctg_pb.fasta

ulimit -n 50000

#consensus script SPARC
#split_and_run_sparc.sh backbone_raw.fasta DBG2OLC_Consensus_info.txt \
#   ctg_pb.fasta \
#   ./consensus_dir 2 > cns_log.txt

#consensus script PBDAGCON
split_and_run_pbdagcon.sh backbone_raw.fasta DBG2OLC_Consensus_info.txt \
    ctg_pb.fasta \
    ./consensus_dir 2>cns_log.err 1>cns_log.out

