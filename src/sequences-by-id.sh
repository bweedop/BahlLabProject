#!bin/bash

grep -w -A 2 -f  $2 $1 --no-group-separator
