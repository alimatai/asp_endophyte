#!/usr/bin/env bash

path=/home/vmataign/Documents/deepimpact/deepimpact_data/deepimpact_analysis/WP2_analysis/asp_endophyte/asp_recipe/pwy_recipe

python $path/pwy_write_facts_in_lp.py

cat $path/pwy_facts.lp > $path/pwy_recette_endophyte.lp
cat $path/pwy_rules.lp >> $path/pwy_recette_endophyte.lp