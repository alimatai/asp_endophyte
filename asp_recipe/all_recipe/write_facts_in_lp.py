#!/usr/bin/env python

import pandas as pd
from pathlib import Path
from numpy import nan

facts = pd.read_csv(Path("/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte/data/table_of_facts.csv"),
	index_col=0,
	header=0,
	sep=",")

with open(Path("/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte/asp_recipe/all_recipe/facts.lp"), "w") as lp:

	# Declare EC and pathways
	# lp.write("% Declare EC and pathways\n\n")
	# for col in facts.columns:
	# 	if "PWY" not in col:
	# 		lp.write(f"""ec("{col}").\n""") # col.replace(".", "-")
	# 	else:
	# 		lp.write(f"""pwy("{col}").\n""")
	
	# Declare models
	lp.write("\n% Declare Models\n\n")
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
