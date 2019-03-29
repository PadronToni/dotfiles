#!/bin/bash

# Variables
LINK_NAME="enabled"
DIR_COLORS=~/.Xresources.d/colors
DIR_LINK=~/.Xresources.d/colors/${LINK_NAME}


# Start script
if [ -z $@ ]
then
    #echo "Current color scheme" $( readlink -e ${DIR_COLORS} )
    ls -I ${LINK_NAME} ${DIR_COLORS}
else
    ln -s -f "${DIR_COLORS}/$@" "${DIR_LINK}"
    exit;
fi
#    if [ "$@" = "--> Advanced (all dirs and files)" ]
#    then
#        echo "--> Normal (only home dirs and files)"
#        locate /
#    else
#        if [[ -d "$@" || -f "$@" ]]
#        then
#            if [ -d "$@" ]
#            then
#                echo "Terminal"
#                echo "File Manager"
#                echo "<--"
#                echo "$@" > ${DIR}
#            fi
#            if [ -f "$@" ]
#            then
#                ${OPEN} "$@" > /dev/null 2>&1 &
#                exit;
#            fi
#        else
#            if [ "$@" = "File Manager" ]
#            then
#                ${FM} "$(cat ${DIR})" > /dev/null 2>&1 &
#                exit;
#            fi
#    
#            if [ "$@" = "Terminal" ]
#            then
#                ${TERM} "$( cat ${DIR} )" > /dev/null 2>&1 & 
#                exit;
#            fi
#            echo "--> Advanced (all dirs and files)"
#            locate home
#        fi
#    fi
#fi





