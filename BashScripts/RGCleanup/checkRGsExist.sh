#!/bin/bash

# File containing resource group names in JSON format
FILE="VScaleAzSecpack.json"
RES="Result.txt"
SUB="7abb5f36-fffb-4700-b2f8-04588d3b8eeb"

# Login to Azure
# echo "Logging into Azure..."
# az login
# az account set -s $SUB

# Read the file and parse the JSON
rg_names=$(jq -r '.[].Name' "$FILE")

# Loop over the resource group names
# for rg_name in $rg_names
# do
#     # Delete the resource group
#     echo "Deleting resource group: $rg_name"
#     az group delete --name "$rg_name" --yes --no-wait
# done

# echo "Resource group deletion initiated for all groups in the file."

# sleep 5m

for rg_name in $rg_names
do
    # Check if the resource group exists
    echo "Checking if resource group exists: $rg_name" | tee -a $RES
    az group exists -n $rg_name | tee -a $RES
done
