# Set up Cloud Foundry API, organization, and space
if cf login -a "$INPUT_CF_API" -u "$INPUT_CF_USERNAME" -p "$INPUT_CF_PASSWORD"; then
    # If login is successful, set the target organization and space
    cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
    # Run the provided cf command
    bash -c "cf $*"
    echo "Connection to Cloud Foundry successful" >> $GITHUB_OUTPUT
else
    # If login fails, print an error message
    echo "Error: Unable to log in to Cloud Foundry. Check your credentials." >> $GITHUB_OUTPUT
    exit 1
fi
