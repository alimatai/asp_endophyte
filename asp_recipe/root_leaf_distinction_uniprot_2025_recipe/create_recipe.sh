#!/usr/bin/env bash

path=/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte
path_recipe=$path/asp_recipe/root_leaf_distinction_uniprot_2025_recipe

python $path_recipe/write_facts_in_lp.py \
	-f $path/data/table_of_facts_isolates_uniprot_2025_01.csv \
	-c $path/data/deepimpact_wp2_fungal_collection.xlsx \
	-o $path_recipe

cat $path_recipe/facts_root.lp > $path_recipe/recette_endophyte_root.lp
cat $path_recipe/rules.lp >> $path_recipe/recette_endophyte_root.lp

# clingo --opt-mode=optN $path_recipe/recette_endophyte_root.lp > $path/results/root/answers.txt

cat $path_recipe/facts_leaf.lp > $path_recipe/recette_endophyte_leaf.lp
cat $path_recipe/rules.lp >> $path_recipe/recette_endophyte_leaf.lp

# clingo --opt-mode=optN $path_recipe/recette_endophyte_leaf.lp > $path/results/leaf/answers.txt