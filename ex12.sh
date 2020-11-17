#!/bin/bash
#Hilla Bartov 315636779
path=$1
#numbering the lines in the file, and print it befor printing a line.
lineNumber=1
#print the contents of the path and sord .
ls "$path" > files.txt
sort  files.txt > sorted.txt
#go over the sort file, and print all the text files.
while IFS= read -r line
do
 if  echo "$line" | grep -q "txt"; then
 echo -n "$lineNumber "
 echo  -n "$line "
 echo "is a file"
  lineNumber=$(($lineNumber+1))
  #when line is not a text file, print it to another file.
 else
  echo "$line" >> folders.txt
 fi
done < sorted.txt
#go over the folders file, and frint all and only the directories.
while IFS= read -r line
do
 if  [[ "$line" != *"."* ]]; then
 echo -n "$lineNumber "
 echo  -n "$line "
 echo "is a directory"
  lineNumber=$(($lineNumber+1))
 fi
done < folders.txt
rm files.txt
rm sorted.txt
rm folders.txt
 