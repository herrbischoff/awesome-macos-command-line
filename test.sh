#/bin/bash

IFS=$'\n'
README=$(sed -n '/^```bash/,/^```/ p' < README.md | sed '/^```/ d' | sed ':a;N;$!ba;s/\&\& \\\n/\&\& /g')

for CMD in $README 
do
  echo 'Testing ' $CMD
  # $CMD
done
