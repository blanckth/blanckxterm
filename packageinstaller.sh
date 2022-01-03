#!/usr/bin/env bash
# Large Installation for Termux App
# Authur : Salar Muhammadi
###################################
declare instl="etc/pkginstaller.txt";
[[ "$#" -gt 0 ]] && instl="$1";
while read line; do
  apt-get install "$line" -y;
done < "$instl";
##################################
