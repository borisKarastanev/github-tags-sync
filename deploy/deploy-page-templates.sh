#!/usr/bin/env bash
### Terminate script on error
set -e

### Global vars TODO Implement a method for more automated folder detection
PAGE_TEMPLATES_BASE_DIR="$1";

GREEN='\033[0;32m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

### A valid sem version e.g [ 3.1.1 | major | minor | patch | ]
NPM_VERSION_UPDATE="$2"

### declare an array of template names
declare -a templates=(
    "git@github.com:NativeScript/nativescript-page-templates.git"
    "git@github.com:NativeScript/nativescript-page-templates-ts.git"
    "git@github.com:NativeScript/nativescript-page-templates-ng.git"
)

### Check PWD
function checkDir() {
    if [[ -d ${PAGE_TEMPLATES_BASE_DIR} ]]; then
        echo ${PWD};
    else
        echo -e "${RED}First argument must be a valid Directory${RED}${NC}";
        exit 1;
    fi
}

### Main function
function run() {
PAGE_TEMPLATES_BASE=$(checkDir)
for i in "${templates[@]}"
do
    cd "${PAGE_TEMPLATES_BASE}/${i}";
    echo -e "${GREEN}Downloading the latest changes from the ${WHITE}${i}${GREEN} repository${NC}"
    git checkout master && git pull

    echo -e "${GREEN}Creating a new npm version ${WHITE}${NPM_VERSION_UPDATE}${NC}"
    npm version ${NPM_VERSION_UPDATE}

    echo -e "${GREEN}Pushing the newly created tag to ${WHITE}${i}${GREEN} repository${NC}"
    git push && git push --tags

    echo -e "${GREEN}Publishing to NPM ${NC}"
    npm publish
done;

}

checkDir
run
echo -e "${GREEN}Done${NC}"
exit 0;
