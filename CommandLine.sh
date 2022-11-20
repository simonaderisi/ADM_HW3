#!/bin/sh

#code that iterates on all the country of interest and retrieves:
#1: number of locations in that country
#2: average number of tourists
#3: total number of tourists that visited it

#iterate on all the countries
for country in "Italy" "Spain" "France" "United.*States"
do
    #take only the rows that have the country of interest in the address
    #and save it in a temporary file
    cut -f 4,9 combinedTsv.tsv | grep -E ${country} > tmp
    
    #count lines, sums all the number of tourists per location and find the average
    count=$(wc -l tmp | egrep -o '[0-9]*')
    sum=$(cut -f 1 tmp| awk '{s+=$1}END{print s}')
    let "avg=${sum}/${count}"
    
    #print datas retrieved
    echo "Number of locations in ${country//".*"/ }: ${count}"
    
    echo "Average number of tourists in ${country//".*"/ }: ${avg}"
    
    echo "Total number of people that visited ${country//".*"/ }: ${sum}"
    
    #delete temporary file
    rm tmp
done





