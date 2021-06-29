psbasemap -JX10 -R1/4/-110/-2 -BNeWsf1a1g1:station:/f10a10g2:deep::.deep-temp: -V -K -X3 > interpolation.ps
blockmean temp1.txt -R10/40/-110/-2 -I5m > temp2.xyz
surface temp2.xyz -R10/40/-110/-2 -I5m -Gtemp3.grd
grd2cpt temp3.grd -Crainbow -S17/22/0.1 > temp.cpt
grdimage temp3.grd -JX10 -R10/40/-110/-2 -Ctemp.cpt -K -V -O >> interpolation.ps
grdcontour temp3.grd -JX10 -R10/40/-110/-2 -C0.5 -W1 -A1 -K -V -O >> interpolation.ps
