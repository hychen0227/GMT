makecpt -Chot -T20/40/1 -V -Z > depth.cpt
psbasemap -JM7i -R85/170/-15/50 -Ba10f10NwsE -V -K > triggered.ps
pscoast -JM -R -S135/206/250 -G255/228/181 -V -K -O -A200 >> triggered.ps
psxy LVF.txt -JM -R -Ss0.3 -W4/255/0/0 -: -V -O -K >> triggered.ps
psmeca CMT.txt -JM -R -Sd0.5 -Zdepth.cpt -V -K -O >>  triggered.ps
psscale -D16/12/4/0.3 -Cdepth.cpt -B5 -V -O -K >> triggered.ps
psxy -JM -R -W/255/0/0 -O -K -V >> triggered.ps << EOF
97.060 2.050 
121.4 23.8
101.370 -4.440 
121.4 23.8
92.902 14.099 
121.4 23.8
142.373 38.297 
121.4 23.8
162.211 -11.315
121.4 23.8
EOF
pstext -JM -R -Gblack -V -O -K >> triggered.ps << EOF
162 28.5 15 0 5 MC DEPTH(km)
EOF
