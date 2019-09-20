#!/bin/bash
# This script will take the informative labels that are in the data/ directory 
# and place them into the RAxML output that just has accession numbers for labels

# Read first input file line by line
while IFS= read -r line; do
    # label - holds the current line (label) that is being read
	label="$line"
    # accession - holds the accession number that is associated with current label
	accession=$(echo $label | awk -F\| '{print $1}')
    # Replace the accession number in file input #2 with the informative label
	sed -i "s/.*${accession}.*/>${label}/" "$2"
done < "$1"
