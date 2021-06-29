ls ./pipe > list.txt
for line in `cat list.txt`; do
gmt psbasemap -JX9i/3i -R0/15/-5/0 -B1:"distance(m)":/a0.5f0.1:"depth(m)":WS -V -K > $line.ps
gmt psbasemap -JX9i/3i -R0/15/-5/0 -B0 -Bne -V -K -O >> $line.ps
awk '{if ($4=="C")print$1,-$2-$3,$3}' ./pipe/$line | gmt psxy -JX -R -Sc -W1 -O -K >> $line.ps
awk '{if ($4=="S")print$1,-$2-$3,$3}' ./pipe/$line | gmt psxy -JX -R -Ss -W1 -O -K >> $line.ps
awk '{print$1,$2}' ./divider.txt | gmt psxy -JX -R -W1 -O -K >> $line.ps
awk '{if ($2=="distance")print$1,-2.5}' ./pipe/$line | gmt psxy -JX -R -Sy10 -W1 -O -K >> $line.ps
awk '{print$1,-1.5}' ./pipe/$line | gmt psxy -JX -R -Sy6 -W0.1 -O -K >> $line.ps
awk '{if ($2!="distance")print$1,-3.75,90,$2}' ./pipe/$line | gmt pstext -JX -R -F+a+f6p -N -O -K >> $line.ps
awk '{if ($2!="distance")print$1,-4.25,90,$3}' ./pipe/$line | gmt pstext -JX -R -F+a+f6p -N -O -K >> $line.ps
awk '{if ($2!="distance")print$1,-4.75,90,$1}' ./pipe/$line | gmt pstext -JX -R -F+a+f6p -N -O -K >> $line.ps
awk '{print$1,0.15,$5}' ./pipe/$line | gmt pstext -JX -R -O -N -K >> $line.ps
#awk '{print$1,$2,$3}' ./info.txt | gmt pstext -JX -R -O -N >> $line.ps
#gmt psconvert $line.ps -A -Tj
echo $line 
done
rename -f 's/.txt.ps/.ps/' *.ps
#rename -f 's/.txt.jpg/.jpg/' *.jpg
