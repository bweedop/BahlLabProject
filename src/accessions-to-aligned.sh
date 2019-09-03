#!/bin/bash

cat $1 | tr "\n" "," | sed "s/,$//" > data/formatted_accessions.txt

sed 's/^/efetch -db nucleotide -format fasta -id /' data/formatted_accessions.txt > src/get_accessions.sh

sh src/get_accessions.sh > data/H5_HA_Egypt_Avian-Human.faa

mafft --auto data/H5_HA_Egypt_Avian-Human.faa > data/Aligned_H5_HA_Egypt_Avian-Human.fasta