#!/bin/bash

 #Takes in 1 argument, the files with errors to correct the data
 function correctData(){
         #retrieving date from file path
         directoryPath=$(dirname $1)
         pathDate=$(echo $directoryPath | cut -d"/" -f 2,3,4 | tr "/" "-")

         #replace corrupted dates
         echo "correcting data"
         tail -n3 $1 > tempFile
         echo $pathDate > $1
         cat tempFile >> $1

 }
 #loop through the list of files with data and run the correctdata function on each file
 for file in $(bash checkData) ; do
     correctData $file
done

