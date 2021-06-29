makecpt -Crelief -T-3500/6500/2000 -Z -V > station.cpt
grdgradient taiwan_gdem.grd -A0 -Gcoastal_range_dem1.int -Nt0.75 -V
grdview taiwan_gdem.grd -Qi400 -R121/122/24/25 -JM6i -Cstation.cpt -Icoastal_range_dem1.int -Ba0.25f0.25WSne -V -P -K > stations.ps
pscoast -JM -R -Df -W5 -Na -S0/191/255 -V -K -O >> stations.ps
psxy -JM -R -Gwhite -Sr -W10/0/0/0 -V -O -K >> stations.ps << EOF
121.86 24.077 4.2 2.5
EOF
psxy CWBSN.txt -JM -R -Gblue -Ss0.6 -W5/0/0/0 -V -O -K >> stations.ps
psxy ITRI_HP.txt -JM -R -Ggreen -Sc0.6 -W5/0/0/0 -V -O -K >> stations.ps
psxy IES_BATS.txt -JM -R -Gred -St0.6 -W5/0/0/0 -V -O -K >> stations.ps
pstext names.txt -JM -R -Gblack -V -O -K >> stations.ps
pstext -JX -R -G255/20/147 -V -O -K -N >> stations.ps << EOF
123 27.6 28 0 10 MC HePing Broadband Stations
EOF
psbasemap -R119.5/122.5/21.5/25.5 -Bwesn -JX3.75/5 -G255 -K -O -P -X0.02 -Y11.65 >> stations.ps
pscoast -Rg119.5/122.5/21.5/25.5 -JX -Df -K -O -P -W0.1 >> stations.ps
psxy -JX -R -Sr -W9/255/0/0 -V -O -K >> stations.ps << EOF
121.5 24.5 1.0 1.0 
EOF
