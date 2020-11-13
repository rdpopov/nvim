#!/bin/sh
cd $HOME/.config/nvim/
find configs snippets -type f -name "*.vim" |xargs cat |sed -z "s/\\n\";/ ;/g"|grep -e"map .*<.*>.*\>" -h|grep ";"|sed  -e 's/<silent>//g' -e 's/.*map//g' -e 's/<buffer>//g' -e 's/:.*;/;/g' -e 's/ *;/ ;/g' -e 's/^ *//g' -e 's/<leader>/<\\>/gi' -e 's/<Plug>//gi' -e 's/(.*).*;/;/g' -e 's/".*;/;/g' -e's/> <.*;/> ;/g' -e 's/;/|/g'| column -t -s"|"
