out_ps=05_GMT.ps
input_list=city_2016.list

gmt set PS_MEDIA A4 
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps 
  
gmt psbasemap -R119/122.3/21/26 -Jm4 -B1 -G0/250/250 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -O -K >> $out_ps
awk '{print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -O -K >> $out_ps
  
# end gmt session
gmt psxy -R -J -O -T >> $out_ps 
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg