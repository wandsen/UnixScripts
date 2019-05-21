#!/bin/bash

#creates a file index called townFileIndex with format town:filepath
for file in $(find .. -name *ff*) ; do

    town="$(head -n3 $file | tail -n1)"
   echo "$town:$file" >> townFileIndex
done
