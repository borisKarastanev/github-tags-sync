#!/usr/bin/env bash

### Terminate script on error
set -e

## Global vars TODO Implement a method for more automated folder detection
EXTENSION_BASE_DIR="nativescript-starter-kits";

GREEN='\033[0;32m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

### A valid sem version e.g [ 3.1.1 | major | minor | patch | ]
NPM_VERSION_UPDATE="$1"

### Check PWD
function checkDir() {
    if [[ ${PWD} != *${EXTENSION_BASE_DIR}* ]]; then
        echo -e "${RED}Please run the script from your ${WHITE}${EXTENSION_BASE_DIR}${RED} directory ${NC}";
        exit 1;
    else
        echo ${PWD};
    fi
}

### Check for valid grunt-cli installation
function checkGrunt() {
    if ! grunt_exists="$(type -p "grunt")" || [ -z "$grunt_exists" ]; then
        echo -e "${RED}Please install ${WHITE}grunt-cli${RED} globally${NC}";
        exit 1;
    fi
}

### Main function
function run() {

    echo -e "${GREEN}Downloading the latest changes from the ${WHITE}${EXTENSION_BASE_DIR}${GREEN} repository${NC}"
    git checkout master && git pull

    echo -e "${GREEN}Transpiling all ${WHITE}TypeScript${GREEN} files${NC}"
    grunt

    echo -e "${GREEN}Creating a new npm version ${WHITE}${NPM_VERSION_UPDATE}${NC}"
    npm version ${NPM_VERSION_UPDATE}

    echo -e "${GREEN}Pushing the newly created tag to ${WHITE}${EXTENSION_BASE_DIR}${GREEN} repository${NC}"
    git push && git push --tags

    echo -e "${GREEN}Publishing to NPM ${NC}"
    npm publish

}

checkDir
checkGrunt
run
echo -e "${GREEN}Done${NC}"
exit 0;
