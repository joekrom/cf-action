#!/bin/bash
# Access input variables as environment variables
CF_API=$1
CF_USERNAME=$2
CF_PASSWORD=$3
CF_ORG=$4
CF_SPACE=$5

# Set up Cloud Foundry API, organization, and space
cf -a $CF_API -u $CF_USERNAME -p $CF_PASSWORD -o $CF_ORG -s $CF_SPACE
bash -c "cf $*"
