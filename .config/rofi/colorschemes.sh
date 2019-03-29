#!/bin/bash

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

    LINK_NAME="set"
    DIR_COLORS="${HOME}/.Xresources.d/colors/"
    DIR_LINK=${DIR_COLORS}/${LINK_NAME}
    SCRIPTS_DIR="${HOME}/.scripts/"
    declare SELECTED
    
    ROFI_CONFIG="${HOME}/.config/rofi/"
    THEME="${ROFI_CONFIG}colorscheme.rasi"
    CUR_THEME=$( readlink ${DIR_LINK} )

    ROFI=$(which rofi)
    SED=$(which sed)
    MKTEMP=$(which mktemp)
    
    # Checks if those programs are installed
    if [ -z "${SED}" ]
    then
        echo "Did not find 'sed', script cannot continue."
        exit 1
    fi
    if [ -z "${MKTEMP}" ]
    then
        echo "Did not find 'mktemp', script cannot continue."
        exit 1
    fi
    if [ -z "${ROFI}" ]
    then
        echo "Did not find rofi, there is no point to continue."
        exit 1
    fi
    
    TMP_DIR=$(${MKTEMP})

# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------

    #function create_theme() # This function create a theme based on the selected color scheme, and echo it in temp directory
    #{
    #
    #}

    function refresh_all()
    {
        xrdb ~/.Xresources
        ${SCRIPTS_DIR}./uproficonfig.sh
        ${SCRIPTS_DIR}./transparentBg.sh
        ${SCRIPTS_DIR}./uptelegram.s
        i3-msg restart
    }

# ---------------------------------------------------------
# EXECUTION
# ---------------------------------------------------------
    MESG="""<b>Colorschemes:</b> choose from the list of color schemes in your system

<b>Current:</b> ${CUR_THEME}"""
	THEME_FLAG="-theme ${THEME}"
    RES=$( ls -I ${LINK_NAME} ${DIR_COLORS} | ${ROFI} -dmenu -normal-window -i -lines 6 ${THEME_FLAG} -mesg "${MESG}" )

    # set the selected colorscheme
    cd ${DIR_COLORS}
    ln -s -f "${RES}" "${LINK_NAME}"

    # refresh all the system component
    if [ -n "${RES}" ]
    then
        refresh_all
    fi

