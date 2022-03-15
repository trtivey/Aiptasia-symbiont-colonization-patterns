#!/bin/bash
list=*merge.jpg_Host_results.csv
#use the name of the first set of files minus the prefix.
#By prefix I mean 1-1, 2-1, 1-07-15-17, whatever you put infront of the tile as the identifier.
for file in $list 
do
  A=${file##*/}
  
  B=${A:0:14}
  #I used 3 because my file prefix was 3 characters long. 
  #Change to the number of characters your prefix has
  
  C="merge.jpg_Position_results.csv"
  #use the name of the second set of files minus the prefix.
  
  D=$B$C
  
  E="relative_position.csv"
  #the name of the new files w/o the prefix 
  echo $A
  echo $B
  echo $C
  echo $D
  cat $A $D > $B$E
done
