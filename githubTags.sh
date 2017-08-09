#!/usr/bin/env bash
### Terminate script on error
set -e

### Global vars
TMP_BASE_DIR="fusion-templates";

GREEN='\033[0;32m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

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
done;

}

checkDir
run
exit 0;

#TEST=$(checkDir)
#
#echo "Result ${TEST}"
