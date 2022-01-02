#!/usr/bin/env bash
# Large Installation for Termux App
# Authur : Salar Muhammadi
###################################
declare -r instl="instl.txt";
while read line; do
  apt-get install $line -y;
done < $instl;
##################################
