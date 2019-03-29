#!/bin/bash

# A script to launch rofi with xrdb values

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

# Dirs
    ROFI_CONFIG="${HOME}/.config/rofi/"

# Font
    fontSize=9
    font=$(xrdb -query | grep 'font-regular:'| awk '{print $(NF-2),$(NF-1)}')
    fontBold=$(xrdb -query | grep 'font-bold:'| awk '{print $(NF-2),$(NF-1)}')

# Colors, takes color variables from Xresources file
    foreground=$(xrdb -query | grep 'foreground:'| awk '{print $NF}')
    bag=$(xrdb -query | grep 'background:'| awk '{print $NF}')
    color0=$(xrdb -query | grep 'color0:'| awk '{print $NF}')
    color8=$(xrdb -query | grep 'color8:'| awk '{print $NF}')
    color1=$(xrdb -query | grep 'color1:'| awk '{print $NF}')
    color9=$(xrdb -query | grep 'color9:'| awk '{print $NF}')
    color2=$(xrdb -query | grep 'color2:'| awk '{print $NF}')
    color10=$(xrdb -query | grep 'color10:'| awk '{print $NF}')
    color3=$(xrdb -query | grep 'color3:'| awk '{print $NF}')
    color11=$(xrdb -query | grep 'color11:'| awk '{print $NF}')
    color4=$(xrdb -query | grep 'color4:'| awk '{print $NF}')
    color12=$(xrdb -query | grep 'color12:'| awk '{print $NF}')
    color5=$(xrdb -query | grep 'color5:'| awk '{print $NF}')
    color13=$(xrdb -query | grep 'color13:'| awk '{print $NF}')
    color6=$(xrdb -query | grep 'color6:'| awk '{print $NF}')
    color14=$(xrdb -query | grep 'color14:'| awk '{print $NF}')
    color7=$(xrdb -query | grep 'color7:'| awk '{print $NF}')
    color15=$(xrdb -query | grep 'color15:'| awk '{print $NF}')

# Metrics
    radius=6px
    mar=15px
    pad=12px
    inMar=5px
    inPad=8px

    csBorder=6px
    csPadHor=1%
    csPadBottom=6px

# ---------------------------------------------------------
# ECHOS
# ---------------------------------------------------------

# Writes the config file
echo "
configuration {
	modi: \"window,Dirs:${ROFI_CONFIG}search.sh,combi\";
	combi-modi: \"drun,run\";
	sidebar-mode: true;
    yoffset:40;
	lines: 8;

//  Those change the \"modi\" names displayed 
	display-combi:        \"Applications\";
	display-window:       \"Windows\";
	display-run:          \" \";
	display-drun:         \"\";
	display-keys:         \"SHORT-KEYS\";
}

@import \"${ROFI_CONFIG}main.rasi\"

" > "${ROFI_CONFIG}config.rasi"

# Writes the main theme file
echo "
/**
 * ROFI Dynamic Color Theme
 * User: KLR
 */
* {
    margin:                     0;
    spacing:                    0;
    border:                     0;
    scrollbar:                  false;
    text-color:                 ${foreground};
    background-color:           transparent;
  	font:                       \"${font} ${fontSize}\";
    highlight:                  bold underline ;

    /* Custom */
    defaultBg:                  ${bag};
    semitraBg:                  ${bag}80;
    windowBg:                   ${bag}80;

    normal-normal-text:         ${foreground};
    normal-urgent-text:         ${color1};
    normal-active-text:         ${color2};
    selected-normal-text:       ${color3};
    selected-urgent-text:       @defaultBg;
    selected-active-text:       @defaultBg;
    selected-normal-background: @defaultBg;
    selected-urgent-background: ${color9};
    selected-active-background: ${color10};
}

#window {
    fullscreen:         false;
    location:           north;
    anchor:             north;
    width:              100%;
    children: [ mainbox ];
}


#mainbox {
    border:             2px 0 0 0;
    border-color:       ${bag};
    background-color:   @windowBg;
    children:   [ inputbarBorder, listview, message, sidebar ];
}


//  Inputbar  ----------------------------------------------

#inputbarBorder {
    margin:             ${mar} ${mar} 0 ${mar};
    orientation:        horizontal;
    expand:             false;
    children: [ dummy, inputbar, dummy ];
}
#inputbar {
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
    children:   [ textbox-search, entry ];
}
#case-indicator {
    margin:             0 ${mar} 0 0;
}
#entry {
    orientation:        vertical;
    width:              20em;
    padding:            ${inPad};
}
#textbox-search {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    border-radius:      ${radius};
    font:               \"FontAwesome ${fontSize}\"; 
    str:                \"\";
    text-color:         ${color5};
    background-color:   @defaultBg;
    expand:             false;
}

#dummy {
    orientation:        horizontal;
    expand:             true;
}

//  Sidebar ------------------------------------------------
#sidebar {
    margin:             ${mar};
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand: true;
}
#button {
    padding:            ${pad};
}
#button.selected {
    border-radius:      ${radius};
    text-color:         ${color3};
    background-color:   @defaultBg;
}

//  Listview    --------------------------------------------
#listview {
	columns:            2;
    margin:             ${mar} ${mar} 0 ${mar};
    padding:            ${inPad};
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
}
#element {
    padding: 8px;
    border-radius:      ${radius};
    expand:             false;
}
#element.normal.normal {
    text-color:         @normal-normal-text;
}
#element.normal.urgent {
    text-color:         @normal-urgent-text;
}
#element.normal.active {
    text-color:         @normal-active-text;
}
#element.selected.normal {
    background-color:   @selected-normal-background;
    text-color:         @selected-normal-text;
}
#element.selected.urgent {
    background-color:   @selected-urgent-background;
    text-color:         @selected-urgent-text;
}
#element.selected.active {
    background-color:   @selected-active-background;
    text-color:         @selected-active-text;
}
#element.alternate.normal {
    text-color:         @normal-normal-text;
}
#element.alternate.urgent {
    text-color:         @normal-urgent-text;
}
#element.alternate.active {
    text-color:         @normal-active-text;
}

#message {
    margin:             ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
}

" > ${ROFI_CONFIG}main.rasi

# Writes the alternative theme file
echo "
/**
 * ROFI Dynamic Color Theme
 * User: KLR
 */

* {
    margin:                     0;
    spacing:                    0;
    border:                     0;
    scrollbar:                  false;
    text-color:                 ${foreground};
    background-color:           transparent;
  	font:                       \"${font} ${fontSize}\";
    highlight:                  bold underline ;

    /* Custom */
    defaultBg:                  ${bag};
    semitraBg:                  ${bag}80;
    windowBg:                   ${bag}50;

    normal-normal-text:         ${foreground};
    normal-urgent-text:         ${color1};
    normal-active-text:         ${color2};
    selected-normal-text:       ${color3};
    selected-urgent-text:       @defaultBg;
    selected-active-text:       @defaultBg;
    selected-normal-background: @defaultBg;
    selected-urgent-background: ${color9};
    selected-active-background: ${color10};
}

#window {
    fullscreen:         true;
    location:           center;
    anchor:             center;
    children: [ mainbox ];
}


#mainbox {
    background-color:   @semitraBg;
    children:   [ mainBorder ];
}

mainBorder {
    margin:             0 35% 0 35%;
    children:   [ dummy, inputbar, listview, message, dummy ];
}

//  Inputbar  ----------------------------------------------
#inputbar {
    margin:             ${mar} ${mar} 0 ${mar};
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
    children:   [ textbox-search, entry ];
}
#entry {
    orientation:        vertical;
    width:              20em;
    padding:            ${inPad};
}
#textbox-search {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    border-radius:      ${radius};
    font:               \"FontAwesome ${fontSize}\"; 
    str:                \"\";
    text-color:         ${color5};
    background-color:   @defaultBg;
    expand:             false;
}

#dummy {
    expand:             true;
}

//  Listview    --------------------------------------------
#listview {
    margin:             ${mar} ${mar} 0 ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
    expand:             false;
}
#element {
    padding: 6px;
}
#element.normal.normal {
    text-color:         @normal-normal-text;
}
#element.normal.urgent {
    text-color:         @normal-urgent-text;
}
#element.normal.active {
    text-color:         @normal-active-text;
}
#element.selected.normal {
    background-color:   @selected-normal-background;
    text-color:         @selected-normal-text;
}
#element.selected.urgent {
    background-color:   @selected-urgent-background;
    text-color:         @selected-urgent-text;
}
#element.selected.active {
    background-color:   @selected-active-background;
    text-color:         @selected-active-text;
}
#element.alternate.normal {
    text-color:         @normal-normal-text;
}
#element.alternate.urgent {
    text-color:         @normal-urgent-text;
}
#element.alternate.active {
    text-color:         @normal-active-text;
}

#message {
    margin:             ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
}

" > ${ROFI_CONFIG}alt.rasi


# Writes the colorscheme theme file
echo "
/**
 * ROFI Dynamic Color Theme
 * User: KLR
 */

* {
    margin:                     0;
    spacing:                    0;
    border:                     0;
    scrollbar:                  false;
    text-color:                 ${foreground};
    background-color:           transparent;
  	font:                       \"${font} ${fontSize}\";
    highlight:                  bold underline ;

    /* Custom */
    defaultBg:                  ${bag};
    semitraBg:                  ${bag}70;
    windowBg:                   ${bag}50;

    normal-normal-text:         ${foreground};
    normal-urgent-text:         ${color1};
    normal-active-text:         ${color2};
    selected-normal-text:       ${color3};
    selected-urgent-text:       @defaultBg;
    selected-active-text:       @defaultBg;
    selected-normal-background: @defaultBg;
    selected-urgent-background: ${color9};
    selected-active-background: ${color10};
}

#window {
    fullscreen:         true;
    location:           center;
    anchor:             center;
    children: [ mainbox ];
}


#mainbox {
    background-color:   @semitraBg;
    children:   [ mainBorder ];
}

mainBorder {
    margin:             0 20% 0 20%;
    children:   [ dummy, inputbarBorder, listview, message, csBorder, dummy ];
}

//  Inputbar  ----------------------------------------------
#inputbarBorder {
    margin:             ${mar} ${mar} 0 ${mar};
    orientation:        horizontal;
    expand:             false;
    children: [ dummy, inputbar, dummy ];
}
#inputbar {
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
    children:   [ textbox-search, entry ];
}
#entry {
    orientation:        vertical;
    width:              20em;
    padding:            ${inPad};
}
#textbox-search {
    padding:            ${inPad} ${pad} ${inPad} ${pad};
    border-radius:      ${radius};
    font:               \"FontAwesome ${fontSize}\"; 
    str:                \"\";
    text-color:         ${color5};
    background-color:   @defaultBg;
    expand:             false;
}

#dummy {
    expand:             true;
}

//  Listview    --------------------------------------------
#listview {
    margin:             ${mar} ${mar} 0 ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
    expand:             false;
}
#element {
    padding: 6px;
}
#element.normal.normal {
    text-color:         @normal-normal-text;
}
#element.normal.urgent {
    text-color:         @normal-urgent-text;
}
#element.normal.active {
    text-color:         @normal-active-text;
}
#element.selected.normal {
    background-color:   @selected-normal-background;
    text-color:         @selected-normal-text;
}
#element.selected.urgent {
    background-color:   @selected-urgent-background;
    text-color:         @selected-urgent-text;
}
#element.selected.active {
    background-color:   @selected-active-background;
    text-color:         @selected-active-text;
}
#element.alternate.normal {
    text-color:         @normal-normal-text;
}
#element.alternate.urgent {
    text-color:         @normal-urgent-text;
}
#element.alternate.active {
    text-color:         @normal-active-text;
}

#message {
    margin:             ${mar};
    padding:            ${pad};
    border-radius:      ${radius};
    background-color:   @defaultBg;
}

// Color Scheme ----------------------------------
#csBorder {
    orientation:        horizontal;
    margin:             0 ${mar} ${mar} ${mar};
    //margin:             ${mar};
    padding:            0; 
    border-radius:      ${radius};
    background-color:   @semitraBg;
    expand:             false;
    children:           [ textbox-colors, textbox-color0, textbox-color8, textbox-color1, textbox-color9, textbox-color2, textbox-color10, textbox-color3, textbox-color11, textbox-color4, textbox-color12, textbox-color5, textbox-color13, textbox-color6, textbox-color14, textbox-color7, textbox-color15  ];
}
#textbox-colors {
    padding:            ${pad};
    font:               \"${fontBold} ${fontSize}\";
    str:                \"Color Scheme\";
    background-color:   ${bag};
}
#textbox-color0 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:               \"${fontBold} ${fontSize}\";
    str:                \"0\";
	text-color:   	${color0};
	border-color:   	${color0};
    expand:             false;
}
#textbox-color8 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
	font:               \"${fontBold} ${fontSize}\";
	str:                \"8\";
	text-color:   ${color8};
	border-color:   ${color8};
	expand:             false;
}
#textbox-color1 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:               \"${fontBold} ${fontSize}\";
    str:                \"1\";
    text-color:   ${color1};
    border-color:   ${color1};
	expand:             false;
}
#textbox-color9 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"9\";
    text-color:   ${color9};
    border-color:   ${color9};
	expand:         false;
}
#textbox-color2 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"2\";
    text-color:   ${color2};
    border-color:   ${color2};
	expand:         false;
}
#textbox-color10 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"10\";
    text-color:   ${color10};
    border-color:   ${color10};
	expand:         false;
}
#textbox-color3 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"3\";
    text-color:   ${color3};
    border-color:   ${color3};
	expand:         false;
}
#textbox-color11 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"11\";
    text-color:   ${color11};
    border-color:   ${color11};
	expand:         false;
}
#textbox-color4 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"4\";
    text-color:   ${color4};
    border-color:   ${color4};
	expand:         false;
}
#textbox-color12 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"12\";
    text-color:   ${color12};
    border-color:   ${color12};
	expand:         false;
}
#textbox-color5 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"5\";
    text-color:   ${color5};
    border-color:   ${color5};
	expand:         false;
}
#textbox-color13 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"13\";
    text-color:   ${color13};
    border-color:   ${color13};
	expand:         false;
}
#textbox-color6 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"6\";
    text-color:   ${color6};
    border-color:   ${color6};
	expand:         false;
}
#textbox-color14 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"14\";
    text-color:   ${color14};
    border-color:   ${color14};
	expand:         false;
}
#textbox-color7 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:             0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"7\";
    text-color:   ${color7};
    border-color:   ${color7};
	expand:         false;
}
#textbox-color15 {
    padding:            ${pad} ${csPadHor} ${csPadBottom} ${csPadHor};
    border:         0 0 ${csBorder} 0;
    font:           \"${fontBold} ${fontSize}\";
    str:            \"15\";
    text-color:   ${color15};
    border-color:   ${color15};
	expand:         false;
}


" > ${ROFI_CONFIG}colorscheme.rasi

