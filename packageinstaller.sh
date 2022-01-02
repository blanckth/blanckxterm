#!/usr/bin/env bash
# Large Installation for Termux App
# Authur : Salar Muhammadi
###################################
declare instl="pkginstaller.txt";
[[ $# -gt 0 ]] && instl="$1";
declare cmnd='apt-get install ';
while read line; do
  cmnd+="$line "
done < $pkginstaller;
`$cmnd`;
##################################
