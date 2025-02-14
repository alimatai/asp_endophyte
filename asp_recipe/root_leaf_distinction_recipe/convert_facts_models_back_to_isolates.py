#!/usr/bin/env python

import pandas as pd
from numpy import nan
from pathlib import Path
import argparse

# Convert facts index (esmecata models) back to isolates

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--facts", help="table_of_facts.csv table used for ASP recipe at the models' level (csv table models*EC-PWY)")
parser.add_argument("-l", "--link", help="proteome_tax_id.tsv table from EsMeCaTa output")
parser.add_argument("-o", "--outfile", help="table_of_facts_isolates.csv")
args = parser.parse_args()

# ../../data/table_of_facts.csv
# ../../data/proteome_tax_id.tsv
# ../../data/table_of_facts_isolates.csv

facts = pd.read_csv(Path(args.facts),
	index_col=0,
	header=0,
	sep=",")

link = pd.read_csv(Path(args.link),
	index_col=0,
	header=0,
	sep="\t")

df = pd.DataFrame("NA", index=link.index, columns=facts.columns)

for idx in df.index:
	model = link.loc[idx, "name"]
	for col in df.columns:
		value = facts.loc[model, col]
		df.loc[idx, col] = value

# eccols = [col for col in df.columns if "PWY" not in col]
# df[eccols] = df[eccols].astype(int)

df.to_csv(Path(args.outfile), na_rep="NA")
