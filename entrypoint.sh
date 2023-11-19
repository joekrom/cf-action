#!/bin/bash

# Set up Cloud Foundry API, organization, and space
cf -a "$INPUT_CF_API" -u "$INPUT_CF_USERNAME"-p "$INPUT_CF_PASSWORD" -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
echo "connection to cloud foundry successful" >> $GITHUB_OUTPUT
# run cf command
bash -c "cf $*"
