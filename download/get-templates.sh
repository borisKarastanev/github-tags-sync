#!/usr/bin/env bash
### Terminate script on error
set -e

### Global vars TODO Implement a method for more automated folder detection
TMP_BASE_DIR="fusion-templates";

GREEN='\033[0;32m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

### declare an array of template names
declare -a templates=(
    "git@github.com:NativeScript/template-drawer-navigation.git"
    "git@github.com:NativeScript/template-tab-navigation.git"
    "git@github.com:NativeScript/template-master-detail.git"
    "git@github.com:NativeScript/template-blank.git"
    "git@github.com:NativeScript/template-drawer-navigation-ts.git"
    "git@github.com:NativeScript/template-master-detail-ts.git"
    "git@github.com:NativeScript/template-blank-ts.git"
    "git@github.com:NativeScript/template-tab-navigation-ts.git"
    "git@github.com:NativeScript/template-drawer-navigation-ng.git"
    "git@github.com:NativeScript/template-tab-navigation-ng.git"
    "git@github.com:NativeScript/template-master-detail-ng.git"
    "git@github.com:NativeScript/template-blank-ng.git"
    "git@github.com:NativeScript/template-master-detail-kinvey-ng.git"
    "git@github.com:NativeScript/template-master-detail-kinvey-ts.git"
    "git@github.com:NativeScript/template-master-detail-kinvey.git"

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
    echo -e "${GREEN}Downloading the latest changes from the ${WHITE}${i}${GREEN} repository${NC}"
    git clone ${i}

done;

}

checkDir
run
echo -e "${GREEN}Done${NC}"
exit 0;
