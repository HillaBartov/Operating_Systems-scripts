#!/bin/bash
#Hilla Bartov 315636779
file=$1
word=$2
#counting number of line, to print when word is in the line.
lineNumber=1
echo "" >>"$file"
while IFS= read -r line
do
#searching for the specific given word, and print the line number, and the number of words in line.
 if  echo "$line" | grep -q -w "$word"; then
 echo -n "$lineNumber "
 echo "$line"|wc -w 
 fi
 lineNumber=$(($lineNumber+1))
done < "$file"