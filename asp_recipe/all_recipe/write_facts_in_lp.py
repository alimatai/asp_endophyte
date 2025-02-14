#!/usr/bin/env python

import pandas as pd
from pathlib import Path
from numpy import nan
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--facts", help="csv table models*EC-PWY (only the ones the user is interested in, table_of_facts.csv")
parser.add_argument("-o", "--outfile", help="annotation written as lp facts (facts.lp)")
args = parser.parse_args()

facts = pd.read_csv(Path(args.facts),
	index_col=0,
	header=0,
	sep=",")

with open(Path(args.outfile), "w") as lp:

	# Declare models
	lp.write("% Declare Models\n\n")
	for idx in facts.index:
		lp.write(f"""species({idx.lower().replace(" ", "")}).\n""")

	# Declare annotations
	lp.write("\n% Declare Annotations\n\n")
	for i in range(facts.shape[0]):
		for j in range(facts.shape[1]):
			value = facts.iloc[i, j]
			if value not in [0, nan]:
				if "PWY" not in facts.columns[j]:
					lp.write(f"""annotation({facts.index[i].lower().replace(" ", "")}, "{facts.columns[j]}", {value}).\n""")
				elif "PWY" in facts.columns[j]:
					lp.write(f"""annotation({facts.index[i].lower().replace(" ", "")}, "{facts.columns[j]}", {value[0]}).\n""")

	lp.write("\n")
