 #!/bin/bash
#Check whether a particular directory exists if does not exist, create the directory
 #takes in 3 parameters (year, month, date)
 function checkDirectoryExist(){
yearExist=no
monthExist=no
 dayExist=no

     #check if directory year exist
    if [ ! -e ./$1 ] ; then
        echo "$1 year does not exist creating directory"
        mkdir ./$1
    else
        yearExist=yes
    fi

    #check if directory month exist
     if [ ! -e ./$1/$2 ] ; then
        echo "$2 month does not exist creating directory"
        cd ./$1
        mkdir $2
     else
        monthExist=yes
    fi
 
     #check if directory day exist
     if [ ! -e ./$1/$2/$3 ] ; then
        echo "$3 day does not exist creating directory"
        cd ./$1/$2
         mkdir $3
   else
        dayExist=yes
    fi
 
 echo "Checking if directory exist. Year: $yearExist Month: $monthExist Day: $dayExist"
 }
