#!/bin/bash
#SBATCH -J dwildbgfil
#SBATCH -o dwildbgfil.o%j
###SBATCH -N 1                 # Total number of nodes requested (16 cores/node)
#SBATCH -n 1                # Total number of mpi tasks requested
#SBATCH -p RM     # queue (partition) -- normal, development, largemem, etc.
#SBATCH -t 48:00:00        # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=solarese@uci.edu
#SBATCH --mail-type=begin  # email me when the job starts
#SBATCH --mail-type=end    # email me when the job finishes

#180mb * 30x = 540000
INPUT="dwilli_std.fastq"

#bioawk -cfastx '{print $name, length($seq)}' ${INPUT} | sort -k2 -nr >  contiglengths.txt
#python find30x.py
for i in $(cat contigs30x.txt)
   do bioawk -cfastx '$name=="'"$i"'" {print $name"\n"$seq}' dwilli_std.fastq > dwilli_std_30x.fasta
done
