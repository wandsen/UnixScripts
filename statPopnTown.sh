#!/bin/bash
 #The script takes in many arguments (town names), the town na,e and reports the average, maximum and minimum population in a town aggregate    d in all the years.



 #Checks----------------------------------------------
 #Check that arguments are inserted
 if [ $# -eq 0 ] ; then
     echo "No arguments provided, please enter at town name"
     exit 1
 fi

 #Check that town exist
 function checkTownExist(){
     resultsFound=nil
     noTown=nil
     while read line ; do
         town=$(echo $line | cut -d":" -f1)
         if [ $town = $1 ] ; then
             resultsFound=yes
             break
         else
             noTown=$1
         fi

     done < ./townFileIndex

     if [ $resultsFound = nil ] ; then
         echo -e "$noTown:\nCannot find this town in the current records"
     else
         resultsFound=nil
         echo true
     fi
 }
 
 
 #Calculation-----------------------------------------------
