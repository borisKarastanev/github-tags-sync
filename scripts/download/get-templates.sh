#!/usr/bin/env bash
### Terminate script on error
set -e

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

### Main function
function run() {
for i in "${templates[@]}"
do
    echo -e "${GREEN}Downloading the latest changes from the ${WHITE}${i}${GREEN} repository${NC}"
    git clone ${i}

done;

}

run
echo -e "${GREEN}Done${NC}"
exit 0;
