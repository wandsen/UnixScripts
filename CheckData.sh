#!/bin/bash

errorFiles=0

#Takes in 2 arguments (path, dates, dates) to see if match. if it matches ++ errorFiles
 function checkMatch(){
     if [ $2 != $3 ]  ; then
         errorFiles=$((errorFiles+1))
         echo $1
      fi
 }
#Loop through the file directory for -name 'ff' files and maniplulate the data the find errors
for file in $(find ../ -name "*ff*" -type f ) ; do

     #Retrieving date from file path
     directoryPath=$(dirname $file)
     pathDate=$(echo $directoryPath | cut -d"/" -f 2,3,4 | tr "/" "-")

     #Retrieve date from file content
     contentDate=$(head -n1 $file)
     checkMatch $file $pathDate $contentDate

done
