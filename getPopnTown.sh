#!/bin/bash

 #1 positional argument townName

 #checks for correct number of arguments
 if [ $# -eq 0 ] ; then
     echo "you have not entered an argument"
     exit 1
 fi

 function getPops(){

     resultsFound=nil

 while read line ; do
     town=$(echo $line | cut -d":" -f1)
     path=$(echo $line | cut -d":" -f2)

     if [ $town = $1 ] ; then
         echo "$(head -n1 $path):$(tail -n1 $path)"
         resultsFound=yes
     fi
 done < ./townFileIndex

 }

 #loops through each argument
 for ((i=1;1<=$#;i++)) ; do
     echo $1:
     getPops $1

     if [ $resultsFound = nil ] ; then
         echo "Can not find this town in the current records"
     fi
     resultsFound=nil

      shift
 done
