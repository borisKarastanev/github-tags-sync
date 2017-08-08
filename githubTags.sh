#!/usr/bin/env bash

## Global vars
TMP_BASE_DIR="fusion-templates";

## declare an array of template names
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

## Check PWD
function checkDir() {
    if [[ ${PWD} != *${TMP_BASE_DIR}* ]]; then
        echo "Please run the script from the ${TMP_BASE_DIR} directory";
        exit -1;
    else
        echo ${PWD};
    fi
}

## Main function
function run() {

for i in "${templates[@]}"
do
    TMP_DIR="$(checkDir)/$i";
    echo "Downloading the latest changes from the ${i} repository"
    cd ${TMP_DIR}
    git checkout master && git pull
done;

}

run
exit 0;

#TEST=$(checkDir)
#
#echo "Result ${TEST}"
