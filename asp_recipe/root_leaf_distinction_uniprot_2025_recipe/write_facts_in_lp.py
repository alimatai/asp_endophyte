#!/usr/bin/env python

import pandas as pd
from pathlib import Path
from numpy import nan

import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--facts", help="csv table models*EC-PWY at the isolates level (table_of_facts_isolates.csv)")
parser.add_argument("-c", "--collection", help="xlsx summary of the culture collection")
parser.add_argument("-o", "--outpath", help="annotation written as lp facts (facts.lp)")
args = parser.parse_args()

facts = pd.read_csv(Path(args.facts),
	index_col=0,
	header=0,
	sep=",")

culture_collection = pd.read_excel(Path(args.collection),
	index_col=0,
	header=0,
	sheet_name=0)

# Filter facts to keep isolates of root
ro_culture_co = culture_collection.loc[culture_collection["COMPARTMENT"]=="RO"]
cross = list(set(ro_culture_co.index).intersection(set(facts.index)))
facts_of_ro_isolates = facts.loc[cross,:]

# Filter facts to keep isolates of leaf
lf_culture_co = culture_collection.loc[culture_collection["COMPARTMENT"]=="LF"]
cross = list(set(lf_culture_co.index).intersection(set(facts.index)))
facts_of_lf_isolates = facts.loc[cross,:]

def write_facts(openfile, facts):
	# Declare models
	openfile.write("% Declare Models\n\n")
	for idx in facts.index:
		openfile.write(f"""species("{idx}").\n""")

	# Declare annotations
	openfile.write("\n% Declare Annotations\n\n")
	for i in range(facts.shape[0]):
		for j in range(facts.shape[1]):
			value = facts.iloc[i, j]
			if value not in [0, nan]:
				if "PWY" not in facts.columns[j]:
					openfile.write(f"""annotation("{facts.index[i]}", "{facts.columns[j]}", {value}).\n""")
				elif "PWY" in facts.columns[j]:
					openfile.write(f"""annotation("{facts.index[i]}", "{facts.columns[j]}", {value[0]}).\n""")

	openfile.write("\n")

with open(Path(f"{args.outpath}/facts_root.lp"), "w") as lpr:
	write_facts(lpr, facts_of_ro_isolates)

with open(Path(f"{args.outpath}/facts_leaf.lp"), "w") as lpf:
	write_facts(lpf, facts_of_lf_isolates)
