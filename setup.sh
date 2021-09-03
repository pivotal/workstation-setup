#!/usr/bin/env bash
#
# setup.sh:  run the workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

LIGHT_CYAN="\033[1;36m"
GREEN="\033[0;32m"
RED="\033[0;31m"
NO_COLOUR="\033[0m"
UNDERLINE="\033[4m"
NO_STYLE=$NO_COLOUR
bold=$(tput bold)
normal=$(tput sgr0)

MY_DIR="$(dirname "$0")"
OPT_IN_FOLDER="${MY_DIR}/scripts/opt-in"

SELECTED_OPT_INS=()

present_options () {
    shopt -s nullglob
    local optionsArray=($OPT_IN_FOLDER/*)
    shopt -u nullglob # Turn off nullglob to make sure it doesn't interfere with anything later

    local optionNamesArray=()
    for index in ${!optionsArray[@]}; do
        optionNamesArray+=(`echo ${optionsArray[index]} | sed -e "s:\.sh$::" -e "s:${OPT_IN_FOLDER}/::"`)
    done

    while true; do
        clear
        echo "Available Opt-Ins:"
        for index in ${!optionsArray[@]}; do
            local offsetIndex=$(expr $index + 1)
            printf "%d.\t${LIGHT_CYAN}%s${NO_COLOUR}\n" ${offsetIndex} ${optionNamesArray[index]}
        done
        IFS=','
        local chosenOptInsString chosenOptIns
        read -p "Selected (comma-separated):" chosenOptInsString
        read -a chosenOptIns <<< "$chosenOptInsString"
        echo "---------------------------------------------------"
        echo "You have selected the following Opt-Ins to install:"
        for index in ${chosenOptIns[@]}; do
            local optionName=${optionNamesArray[index - 1]}
            printf "${GREEN}%s${NO_COLOUR}\n" $optionName
            SELECTED_OPT_INS+=($optionName)
        done
        local optInsAreCorrect
        read -p "Are these correct (y/n)? " optInsAreCorrect
        if [ "$optInsAreCorrect" == "y" ]; then
            return 0;
        else
            SELECTED_OPT_INS=()
        fi
    done
}

prompt_for_options () {
    local wantToInstallOptIns
    read -p "Would you like to install opt-ins (y/n)? " wantToInstallOptIns
    if [ "$wantToInstallOptIns" != "y" ]; then
        return 0
    fi
    present_options
}

has_param () {
    local terms="$1"
    shift
    for term in $terms; do
        for arg; do
            if [[ $arg == "$term" ]]; then
                return 0
            fi
        done
    done
    return 1
}

# If there are no args
if [ -z $@ ]; then
    prompt_for_options
elif has_param "-h --help" "$@"; then
    printf "\n${bold}NAME${normal}\n"
    printf "\t${0} - install commonly needed workstation tools\n"
    printf "\n${bold}SYNOPSIS${normal}\n"
    printf "\t${bold}${0}${normal} [${UNDERLINE}FLAG${NO_STYLE}]... [${UNDERLINE}OPT-IN${NO_STYLE}]...\n"
    printf "\n${bold}DESCRIPTION${normal}\n"
    printf "\tSetup behaves in two different ways depending on whether any OPT-INs have been passed in. Passing in OPT-INS will be referred to as ${bold}PASSIVE${normal} mode and passing ${UNDERLINE}no${NO_STYLE} OPT-INS will be referred to as ${bold}INTERACTIVE${normal} mode. Both modes also take in a small set of optional FLAGs:\n"
    printf "\n\t${bold}-h${normal}, ${bold}--help${normal}\n"
    printf "\t\tdisplay this help and exit\n"
    printf "\n\t${bold}--skip-analytics${normal}\n"
    printf "\t\tskips google analytics statistics capture and upload\n"
    printf "\t\t${bold}Note${normal}: If not set, the setup will default to whether the environment variable ${bold}SKIP_ANALYTICS${normal} is set. If the environment variable is not set and you are running in ${bold}INTERACTIVE${normal} mode, you will be prompted by the interface as to your decision."
    exit 0
elif [ "$#" -eq 1 ] && has_param "--skip-analtyics" "$@"; then
    SKIP_ANALYTICS=1
    prompt_for_options
else
    echo "You passed in the following opt-ins:"
    for var in "$@"; do
        printf "${GREEN}%s${NO_COLOUR}\n" $var
    done
    SELECTED_OPT_INS=$@
fi

echo $SELECTED_OPT_INS

init_analytics () {
    # If SKIP_ANALYTICS wasn't defined and there were no args
    if [ -z $SKIP_ANALYTICS ] && [ $1 == 0 ]; then
        local wantToShareAnalytics
        read -p "Share usage analytics (y/n)? " wantToShareAnalytics
        if [ "$wantToShareAnalytics" != "y" ]; then
            SKIP_ANALYTICS=1
            printf "${LIGHT_CYAN}Analytics will not be shared${NO_COLOUR}\n"
        else
            SKIP_ANALYTICS=0
            printf "${GREEN}Analytics will be shared${NO_COLOUR}\n"
        fi
    fi
    SKIP_ANALYTICS=${SKIP_ANALYTICS:-0}
    if (( SKIP_ANALYTICS == 0 )); then
        clientID=$(od -vAn -N4 -tx  < /dev/urandom)
        source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} start $SELECTED_OPT_INS
    else
        export HOMEBREW_NO_ANALYTICS=1
    fi
}

init_analytics $#

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/common/homebrew.sh

# Install everything else
source ${MY_DIR}/scripts/common/oh-my-zsh.sh
source ${MY_DIR}/scripts/common/editors.sh
source ${MY_DIR}/scripts/common/git.sh
source ${MY_DIR}/scripts/common/git-aliases.sh
source ${MY_DIR}/scripts/common/applications-common.sh
source ${MY_DIR}/scripts/common/developer-utilities.sh
source ${MY_DIR}/scripts/common/unix.sh
source ${MY_DIR}/scripts/common/configuration-osx.sh

# For each command line argument, try executing the corresponding script in opt-in/
for var in "$SELECTED_OPT_INS"
do
    echo "$var"
    FILE=${OPT_IN_FOLDER}/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done

source ${MY_DIR}/scripts/common/finished.sh
if (( SKIP_ANALYTICS == 0 )); then
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} finish $SELECTED_OPT_INS
fi
