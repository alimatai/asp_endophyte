#!/usr/bin/env bash

path=/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte/asp_recipe/ec_recipe

python $path/ec_write_facts_in_lp.py

cat $path/ec_facts.lp > $path/ec_recette_endophyte.lp
cat $path/ec_rules.lp >> $path/ec_recette_endophyte.lp

# clingo --enum-mode=brave $path/ec_recette_endophyte.lp