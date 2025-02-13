#!/usr/bin/env bash

path=/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte/asp_recipe/all_recipe

python $path/all_write_facts_in_lp.py

cat $path/all_facts.lp > $path/recette_endophyte.lp
cat $path/all_rules.lp >> $path/recette_endophyte.lp

# clingo --enum-mode=brave $path/recette_endophyte.lp