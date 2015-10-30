set title "Temperaturverlauf"
set ylabel "Temperatur [°C]"
#set xlabel "Messzeitpunkt"
set xdata time # x-Achse wird im Datums/Zeitformat skaliert
set timefmt "%Y-%m-%dT%H:%M:%S+0000" # Format Zeitangaben yyyy.mm.dd_hh:mm:ss
set format x "%d.%m.\n%H:%M" # Format für die Achsenbeschriftung
set yrange [-20:60] # die y-Achse geht von:bis
set terminal png
set output "temp.png"
plot "temp.data" using 1:2 title "Speicher (lm75)" with lines
