#!/bin/bash

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

    OPTIONS=( "Lock" "Log Off" "Poweroff" "Restart" '<span foreground="blue" size="x-large">Blue text</span> is <span gravity="west">cool</span>' )
    ROFI_CONFIG="${HOME}/.config/rofi/"
    THEME="${ROFI_CONFIG}alt.rasi"

# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------

    # Prints all the elements of the array 
    function print_options()
    {
        for i in "${OPTIONS[@]}"
        do
            echo $i
        done    
    }

# ---------------------------------------------------------
# START
# ---------------------------------------------------------


    MESG="""<b>Power Menu:</b> choose between the list of action... sas"""
	THEME_FLAG="-theme ${THEME}"
    THEME_STR_FLAG="-theme-str '#window mainbox mainBorder { margin: 0 20% 0 20%; }'"

    RES=$( print_options | rofi -dmenu -normal-window -markup-rows -i -lines 4 ${THEME_FLAG} -mesg "${MESG}" )
    
    case "${RES}" in
        "Lock")
            exec i3lock-next
            ;;
    
        "Log Off")
            exec killall -u ${USER}
            ;;
        "Poweroff")
            exec poweroff
            ;;
        "Restart")
            exec reboot
            ;;
        *)
            echo "sas"
            ;;
    esac



