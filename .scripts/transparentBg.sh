
#!/bin/bash

bag=$(xrdb -query | grep 'background:'| awk '{print $NF}')
transparency='80'

echo ${transparency}${bag:1} > ~/.config/polybar/transparentBg

