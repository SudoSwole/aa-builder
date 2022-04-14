#!/bin/bash

dir=someWhere
dest=someWhereElse
toCopyList=filesomewhere
notCopied=filesomewhereElse

while read line; do
   find "$dir" -name "$line" -exec cp '{}' $dest \; -printf "%f\n"     
done < "$toCopyList" > cpList

#sed -i 's#'$dir'/##' cpList
# I used # instead of / in sed to not confuse sed with / in $dir
# Also, I assumed the string in $dir doesnot end with a /

cat cpList "$toCopyList" | sort | uniq -c | sed -nr '/^ +1/s/^ +1 +(.*)/\1/p' > "$notCopied"
# Will not work if you give wild cards in your "toCopyList"
