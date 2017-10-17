#!/usr/bin/env bash
### Terminate script on error
set -e

GREEN='\033[0;32m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

### declare an array of template names
declare -a templates=(
    "git@github.com:NativeScript/nativescript-page-templates.git"
    "git@github.com:NativeScript/nativescript-page-templates-ts.git"
    "git@github.com:NativeScript/nativescript-page-templates-ng.git"
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