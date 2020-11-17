#!/bin/bash
#Hilla Bartov 315636779
path=$1
file=$2
#enter the path and print its contents to a file to fo over in while loop.
cd "$path"
ls > p.txt
 while IFS= read -r line
 do
 #when file is found in the current directory, print its content.
 if  echo "$line" | grep -q -w "$file"; then  
   awk '{ print }' "$file"
   #when line is a directory, check if contains the file we search.
 elif  [[ "$line" != "." ]]; then
 ls "$line" > folder.txt
 if  grep -q -w "$file" folder.txt; then
 #when file is found cd to directory, and print the file's content.
 cd "$line"
  awk '{ print }' "$file"
  #go back to previous directory, to continue the search.
 cd ..
  fi
  fi
 done < p.txt