#!/bin/sh
echo -n $(vmstat|awk 'NR==3{printf "Cpu "$13+$14"% |"}') $(free|awk 'NR==2{printf " Ram %d% | ",($3/$2)*100}') $(date +" %h-%d | %H:%M ")
