name: Deploy to Cloud Foundry

on:
  push:
    branches:
    - main

jobs:
  build:
    runs-on: ubuntu-22.04

  deploy:
    runs-on: ubuntu-22.04
    needs: build
    
    steps:
    - uses: joekrom/cf-action@main
      with:
        cf_api: https://api.my-cloud-foundry.com
        cf_username: ${{ secrets.CF_USERNAME }}
        cf_password: ${{ secrets.CF_PASSWORD }}
        cf_org: evo
        cf_space: common
        command: cf push -f manifest.yml
