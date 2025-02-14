#!/usr/bin/env bash

path=/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte
path_recipe=$path/asp_recipe/all_recipe

python $path_recipe/write_facts_in_lp.py \
	-f $path/data/table_of_facts_isolates.csv \
	-o $path_recipe/facts.lp

cat $path_recipe/facts.lp > $path_recipe/recette_endophyte.lp
cat $path_recipe/rules.lp >> $path_recipe/recette_endophyte.lp

# clingo --enum-mode=brave $path_recipe/recette_endophyte.lp > $path/results/all/answers.txt