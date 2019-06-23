#!/usr/bin/env bash

com () {
bats $input | tail -n +2
}
echo "insert path of bats"
read input

echo "insert file name for your xml file"
read file
cat << EOF > $file
<?xml version = "1.0" encoding = "utf-8"?>

<testoutput>
<testresult>
$(com)
</testresult>
</testoutput>
EOF
