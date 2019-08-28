#!/bin/bash

cat data/accession_list.fa | tr "\n" "," | sed "s/,$//" > data/formatted_accessions.txt

sed 's/^/efetch -db nucleotide -format fasta -id /' data/formatted_accessions.txt > src/get_accessions.sh

sh src/get_accessions.sh > data/H3N2_HA-Nucleotide-Seqs_Avian-Canine-Human-Swine.faa

mafft --auto data/H3N2_HA-Nucleotide-Seqs_Avian-Canine-Human-Swine.faa > data/Aligned_H3N2_HA-Nucleotide-Seqs_Avian-Canine-Human-Swine.fasta