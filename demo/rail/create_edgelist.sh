#!/bin/bash
sort -t ',' -k 1 csv/station20161107free.csv > station.csv
sort -t ',' -k 1 csv/line20161107free.csv > line.csv
sort -t ',' -k 2 csv/join20161107.csv > join01.csv
join -t ',' join01.csv station.csv -1 2 -2 1 -o 1.1,2.2,1.3 > join02.csv
sort -t ',' -k 3 join02.csv > join03.csv
join -t ',' join03.csv station.csv -1 3 -2 1 -o 1.1,1.2,2.2 > join04.csv
sort -t ',' -k 1 join04.csv > join05.csv
join -t ',' join05.csv line.csv -1 1 -2 1 -o 2.3,1.2,1.3 > join06.csv
cat station.csv | awk -v FS=',' -v OFS=',' '{if (NR != 1) print $2, "*"}' | sort | uniq > station_uniq.csv
join -t ',' station_uniq.csv station.csv -1 1 -2 1 -o 1.1,1.2,2.3 > rail.csv
cat join06.csv | awk -v FS=',' -v OFS=',' '{print $2, $3, $1, "1"}' >> rail.csv
rm station*.csv
rm line.csv
rm join*.csv
