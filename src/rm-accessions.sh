#!/bin/bash

# Read first input file line by line
while IFS= read -r line; do
    # acc - accession to be removed.
    acc="$line"
    # remove the accessions that are provided in place
	sed -i "/${acc}/d" "$2"
done < "$1"
