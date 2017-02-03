#!/bin/bash
OUTPUT="myoutput"
READ1L="L1_R1.fastq.trimmed"
READ1R="L1_R2.fastq.trimmed"
READ2L="L2_R1.fastq.trimmed"
READ2R="L2_R2.fastq.trimmed"

#PE Trim
#platanus_trim *.fastq

#contig assembly
#platanus assemble -o $OUTPUT –f L[12]_R[12].fastq.trimmed -t 11 -m 60

#scaffolding
#platanus scaffold –o ${OUTPUT} –c ${OUTPUT}_contig.fa –b ${OUTPUT}_contigBubble.fa \
#   -IP1 ./${READ1L} ./${READ1R} –IP2 ./${READ2L} ./${READ2R} \
#   -t 28 2> scaffold.log
#platanus scaffold -o ${OUTPUT} -c ${OUTPUT}_contig.fa -b ${OUTPUT}_contigBubble.fa \
#   -IP1 ${READ1L} ${READ1R} -IP2 ${READ2L} ${READ2R} \
#   -t 11

#gap-closing
#platanus gap_close -o ${OUTPUT} -c ${OUTPUT}_scaffold.fa \
#   -IP1 ${READ1L} ${READ1R} -IP2 ${READ2L} ${READ2R} \
#   -t 11
