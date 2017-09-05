#!/usr/bin/env bash
### Terminate script on error
set -e

### Global vars
TMP_BASE_DIR="fusion-templates";

GREEN='\033[0;32m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

### A valid sem version e.g [ 3.1.1 | major | minor | patch | ]
NPM_VERSION_UPDATE="$1"

### declare an array of template names
declare -a templates=(
    "template-drawer-navigation"
    "template-tab-navigation"
    "template-master-detail"
    "template-blank"
    "template-drawer-navigation-ts"
    "template-master-detail-ts"
    "template-blank-ts"
    "template-tab-navigation-ts"
    "template-drawer-navigation-ng"
    "template-tab-navigation-ng"
    "template-master-detail-ng"
    "template-blank-ng"
    "template-master-detail-kinvey-ng"
    "template-master-detail-kinvey-ts"
    "template-master-detail-kinvey"

)

### Check PWD
function checkDir() {
    if [[ ${PWD} != *${TMP_BASE_DIR}* ]]; then
        echo -e "${RED}Please run the script from your ${WHITE}${TMP_BASE_DIR}${RED} directory ${NC}";
        exit 1;
    else
        echo ${PWD};
    fi
}

### Main function
function run() {
TMP_BASE=$(checkDir)
for i in "${templates[@]}"
do
    cd "${TMP_BASE}/${i}";
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

