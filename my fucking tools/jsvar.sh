#!/bin/bash

target=$1

curl -s $target | grep -Eo "var [a-zA-Z0-9_]+" | sort -u | cut -d" " -f2 | awk 'length($1) >= 3 {print $1}'
