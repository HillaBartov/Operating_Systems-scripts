#!/bin/bash
#Hilla Bartov 315636779
name=$1
file=$2
while IFS= read -r line
do
#check for the specific name we're loocking, and print the activity log when found.
 if  echo "$line" | grep -q -w "$name"; then
 echo  "$line"
 #passing on the line word by word to find the number or an "-" for the balance.
 for word in $line
 do 
 if [[ "$word" =~ ^[0-9]+$ ]] || [[ "$word" == *"-"* ]]; then 
 # when word is a balance print the balance to a file.
  echo "$word" >> balance.txt
  break
 fi
 done
 fi
done < "$file"
#sum up the balance file
echo -n "Total balance: "
awk '{ sum+= $1 } END { print sum }' balance.txt
rm balance.txt