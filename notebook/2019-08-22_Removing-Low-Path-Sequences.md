# 08-29-2019 - Removing Low Pathogenic Sequences

A number of the sequences in the initial set of accessions that I retrieved from GenBank were low pathogenic H5N1 rather than the high pathogenic genotype. I have listed those sequences in the file located at `data/rm-accessions_deletions-at-1027.txt`. These sequences were identified when looking at all sequences together in BioEdit. Given that the high path sequences have an insertion at this location, the low path sequences had a six base pair gap. I was put onto to looking for this because the RAxML tree had a root that was going back further in time that it should have been. 

Additionally, there were some other sequences that had a smaller gap at position 1033. These sequences are in the file at `data/rm-accessions_deletion-at-1033.txt`. I removed these sequences from the analysis as well.
