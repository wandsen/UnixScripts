#!/bin/bash

 year=$1
 averagePop=0
 minimumPop=0
 maximumPop=0
 totalPop=0
 counter=0
 : 'conditional checks whether user input the correct number of arguments exits the script if incoorect'
 if [ $# -ne 2 ] ; then
     echo "You entered the incorrect amount of arguments. Please enter 2 arguments"
     exit 1
 fi


 : 'conditional check whether user entered a year available in the data base. if not, exit script'
 if [ ! -e ../$1 ] ; then
     echo "$1 unavailable in this database. Please enter another year"
     exit 1
 fi


 #calculates the statistics value and store in respective global variables
 for file in $(find ../$year -name "*ff*") ; do
     townPop="$(tail -n1 $file)"

     if [ $townPop -gt $maximumPop ] ; then
         maximumPop=$townPop
     fi

     if [ $townPop -lt $minimumPop ] || [ $counter -eq 0 ] ; then
        minimumPop=$townPop
     fi

     totalPop=$[$totalPop+$townPop]
     counter=$[$counter+1]
