#!/bin/bash

set -e

ROOT="$(pwd)/pypi-server"
SIMPLE="$ROOT/simple"
OUTPUT="$SIMPLE/$1/index.html" # $1 - dest dir

echo "<UL>" > $OUTPUT
for filepath in `find "$SIMPLE/$1/" -type f| sort`; do
    file=`basename "$filepath"`
    if [ $file != "index.html" ]; then
        echo "    <LI><a href=\"$file\">$file</a></LI>" >> $OUTPUT
    fi
done
echo "</UL>" >> $OUTPUT
