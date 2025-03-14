#!/usr/bin/env python

import os
from pprint import pprint
import pandas as pd

# inpath = "/projects/deepimpact/deepimpact_cluster/wp2_cluster/esmecata/outputs/output_fungal_collection_2024"
inpath = "/projects/deepimpact/deepimpact_cluster/wp2_cluster/esmecata/outputs/output_fungal_collection_2024_uniprot_2025_01"

df = pd.read_csv(os.path.join(inpath, "3_analysis", "dataset_annotation_ec.tsv"),
    header=0,
    index_col=0,
    sep="\t")

corresp_models_strains = pd.read_csv(os.path.join(inpath, "0_proteomes", "proteome_tax_id.tsv"),
    header=0,
    index_col=0,
    sep="\t")

# Summary
df['model'] = corresp_models_strains['name']
df = df.groupby(by="model").max()

out = "dataset_annotation_ec_by_model.csv"
df.to_csv(os.path.join(inpath, "3_analysis", out))

# df = pd.read_csv(os.path.join(inpath, "3_analysis", "dataset_annotation_go.tsv"),
#     header=0,
#     index_col=0,
#     sep="\t")

# corresp_models_strains = pd.read_csv(os.path.join(inpath, "0_proteomes", "proteome_tax_id.tsv"),
#     header=0,
#     index_col=0,
#     sep="\t")

# # Summary
# df['model'] = corresp_models_strains['name']
# df = df.groupby(by="model").max()

# out = "dataset_annotation_go_by_model.csv"
# df.to_csv(os.path.join(inpath, "3_analysis", out))
