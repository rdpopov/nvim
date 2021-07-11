#!/bin/sh
echo -n $(vmstat|awk 'NR==3{printf "Cu "$13+$14"%"}') $(lscpu|awk 'NR==15{printf "[%.1f]|",$3/1000}') $(free|awk 'NR==2{printf "Me %.1f/%.1f [%d%]| ",$3/1000000,$2/1000000,($3/$2)*100}') $(df |awk 'NR==4{printf "Fs %s ",$5}')
