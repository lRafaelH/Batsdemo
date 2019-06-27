#!/usr/bin/env bash

output () {
bats $input | tail -n +2
}

duration="$({ time bats -t $input  >/dev/null; } 2>&1 | grep real | tr --delete real)"
success="$(grep -c "ok" "$time".xml)
time="$(date +"%d-%m-%Y")"

echo "insert path of bats"
read input
cat << EOF > $time.xml
<?xml version = "1.0" encoding = "utf-8"?>

<batstest duration=$(echo ${duration//[[:blank:]]/}) success= $success >
<testcases totaltest=>
$(output)
</testresult>
</testoutput>
EOF
