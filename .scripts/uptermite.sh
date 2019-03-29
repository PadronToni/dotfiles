#!/bin/bash

# A script to update termite config file

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

# Font
fontsize=9
font=$(xrdb -query | grep 'font-regular:'| awk '{print $(NF-2),$(NF-1)}')

# Colors
foreground=$(xrdb -query | grep 'foreground:'| awk '{print $NF}')
foreground_bold=$(xrdb -query | grep 'foreground:'| awk '{print $NF}')
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

#Trasforma tutti i caratteri in Maiuscolo
bag=$(echo $bag | tr '[:lower:]' '[:upper:]')

#Divide la stringa per individuare i valori di R,G,B
r=$(expr substr $bag 2 2)
g=$(expr substr $bag 4 2)
b=$(expr substr $bag 6 2)

#Converte r,g e b da HEX a DEC
r_dec=$(echo "ibase=16; $r" | bc )
g_dec=$(echo "ibase=16; $g" | bc )
b_dec=$(echo "ibase=16; $b" | bc )

bg_alpha=0.95

# ---------------------------------------------------------


echo "
[options]
font = $font $fontsize 
dynamic_title = true
bold_is_bright = true

[colors]
# special
foreground      = $foreground
foreground_bold = $foreground_bold
background      = rgba($r_dec, $g_dec, $b_dec, $bg_alpha)

# black
color0  = $color0
color8  = $color8

# red
color1  = $color1
color9  = $color9

# green
color2  = $color2
color10 = $color10

# yellow
color3  = $color3
color11 = $color11

# blue
color4  = $color4
color12 = $color12

# magenta
color5  = $color5
color13 = $color13

# cyan
color6  = $color6
color14 = $color14

# white
color7  = $color7
color15 = $color15


[hints]
#font = Monospace 12
#foreground = #dcdccc
#background = #3f3f3f
#active_foreground = #e68080
#active_background = #3f3f3f
padding = 10
border = #3f3f3f
border_width = 0.5
roundness = 2.0 

" > ~/.config/termite/config 
