import pandas as pd
import numpy as np
import subprocess

def data_preprocessing (path = "data/flu.txt", output_path = 'data/informative_labels.txt'):
    """Processes metadata that is given by NCBI Influenza database. 
    
    This function was designed specifically for this research endeavor and
    SHOULD NOT BE USED for other research without review and customization.

    Args:
        path: The path to the metadata to be preprocessed
        output_path: Path for labels
    
    Returns:
        A comma-separated data table that corresponds to the FASTA file 
        in the data/ directory.
    """

    data = pd.read_table(path, sep = ",")

    # Dates should be in the format of YYYY/MM/DD. If data for the month or day that
    # the data was collected was missing, it was imputed. The method for imputing 
    # was to add the first day of the month if the day was missing and if both month
    #  and day were missing, I imputed the data so that the sample was collected on 
    # 06/01 of the given year.

    new_dates = data.date

    for i in range(0, len(new_dates)):
        if len(new_dates[i]) == 7:
            data.date[i] = new_dates[i] + '/01'
        elif len(new_dates[i]) == 4:
            new_dates[i] = new_dates[i] + '/06/01'
        else:
            pass
    data.date = new_dates

    # City name is given for many of the sequences but it is buried in the name 
    # column. I will extract that and put it into its own column 

    cities = []
    taxa = []

    for i in range(0, len(data.name)):
        name_len = len(data.name[i].split("/"))
        if name_len == 4:
            taxa.append("NA")
            city = data.name[i].split("/")[1]
            if city == "china" or city == "China":
                cities.append("NA")
            else:
                cities.append(city)
        elif name_len == 5:
            taxa.append(data.name[i].split("/")[1])
            city = data.name[i].split("/")[2]
            if city == "china" or city == "China":
                cities.append("NA")
            else:
                cities.append(city)

    data["cities"] = cities
    data["host_taxa"] = taxa

    data.segment = data.segment.replace(to_replace = "4 (HA)", value = "HA")
    for i in range(0, len(data.host_taxa)):
        if data.host_taxa[i] == "NA":
            data.host_taxa[i] = data.host[i]
        else:
            pass
    data.host_taxa = data.host_taxa.str.replace(' ', '-', regex = True)
    data.cities = data.cities.str.replace(' ', '-', regex = True)
    data.date = data.date.str.replace('/', '', regex = True)


    labels = data[['accession', 'serotype', 'segment', 'host', 'host_taxa','country','cities','date']]

    labels.to_csv(path_or_buf = output_path, index = False, header = False)

def main ():
    metadata = data_preprocessing(path = "data/flu.txt", output_path = 'data/informative_labels.txt')



