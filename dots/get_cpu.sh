#!/bin/sh
echo -n $(vmstat|awk 'NR==3{printf " #[bg=#ffe6b3,fg=#14191f] C "$13+$14"%"}') \
        $(free|awk 'NR==2{printf "#[fg=#14191F,bg=#87dfeb] R %.1f/%.1f",$3/1000000,$2/1000000}') \
        $(df |awk 'NR==4{printf "#[fg=#14191F,bg=#d4bfff] %.1f Gb ",$4/1000000}')
