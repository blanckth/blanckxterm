#! /usr/bin/env bash
## Termux Automatic Configuration by Salar Muhammadi
# BlanckTerm
# Import Functions 
. blanck.blk;
#########################################################################
## SOURCE DIR SET
declare -r DIR=`SRCDIR "${BASH_SOURCE[0]}"`;
cd $DIR;
##########################################################################
## VARIABLES
declare -r etcDir="$PREFIX/etc";
declare -r vncDir="$HOME/.vnc";
declare -r aPp=$0;
declare -r cfgDir="$DIR/config"; ! [[ -d $cfgDir ]] && mkdir $cfgDir;
declare -r statValDir="$cfgDir/statval"; ! [[ -d $statValDir ]] && mkdir $statValDir;
declare -r isUpg="$statValDir/isUpg";
declare -r isCfgE="$statValDir/isCfgE";
declare -r isInsE="$statValDir/isInsE";
############################################################################
############################################################################
#############################################################################
## FUNCTIONS
#############################################################################
#############################################################################
#############################################################################
fupg () {
apt-get update;
apt-get dist-upgrade -y && touch $isUpg;
}
uMotd () {
local -r motdd="$etcDir/motd";
echo "Welcome to BlanckTerm!" > "$motdd";
echo "A Custom Termux By Salar Muhammadi" >> "$motdd";
echo "Send me a message at : " >> "$motdd";
echo "mhmdi.salar@gmail.com" >> "$motdd";
echo "Contact Me : +989333747467" >> "$motdd";
echo "==========================" >> "$motdd";
echo '* Search Packages: pkg search <query>' >> "$motdd";
echo '* Install a Package: pkg install <package>' >> "$motdd";
echo '* Upgrade Packages: pkg upgrade' >> "$motdd";
echo "==========================" >> "$motdd";
echo '+- View VNC : vncserver -list' >> "$motdd";
echo '-- kill VNC : vncserver -kill :<number>' >> "$motdd";
echo '++ Run VNC : vncserver [-name <blanckxterm>]' >> "$motdd";
echo "==========================" >> "$motdd";
}
insEsse () {
apt-get install x11-repo -y && apt-get update -y && apt-get upgrade -y && apt-get install proot -y && apt-get install xorg-fonts-100dpi xorg-iceauth xorg-luit xorg-server xorg-server-static xorg-twm xorg-util-macros xorg-xcalc xorg-xclock xorg-xdpyinfo xorg-xev xorg-xhost xorg-xlsfonts xorg-xmessage xorg-xprop xorg-xrandr xorg-xrdb xorg-xsetroot xorg-xwininfo xorgproto libx11-static libxss -y && apt-get install termux-x11 termux-auth termux-exec termux-create-package termux-services termux-elf-cleaner termux-apt-repo termux-api termimage ncurses-utils ncurses-ui-libs-static lf asciinema -y && apt-get install picom putty -y && apt-get install qt5-qtx11extras -y && apt-get install tigervnc -y && apt-get install xfce4 -y && apt-get install xfce4-goodies xfce4-wavelan-plugin-static xfce4-timer-plugin-static xfce4-screenshooter-static xfce4-places-plugin xfce4-places-plugin-static xfce4-panel-static xfce4-notifyd-static xfce4-notes-plugin-static xfce4-mailwatch-plugin-static xfce4-eyes-plugin-static xfce4-dict-static xfce4-datetime-plugin-static xfce4-clipman-plugin-static xfce4-calculator-plugin-static xfce-theme-manager libxfce4util-static libxfce4ui-static -y && apt-get install wget curl git man bc nmap xfconf xfconf-static -y && touch $isInsE;
}
cfgEsse () {
	echo 'export DISPLAY="localhost:0"' >> "$etcDir/bash.bashrc";
	echo 'declare -i vncc=0; for vncl in `vncserver -list`; do vncc+=1; done;' >> "$etcDir/bash.bashrc";
	echo '[[ $vncc -gt 8 ]] && vncserver -kill :13; vncserver :13 -name blanckxterm -geometry 2333x1080 -localhost; vncserver -list;' >> "$etcDir/bash.bashrc";
	touch $isCfgE;
}
vncSetup () {
# VNC X Startup Config
local -r vncXS="$vncDir/xstartup";
# VNC Start
vncserver :13 -name blanckxterm -geometry 1920x1080 -localhost;
vncserver -list;
echo '#!/usr/bin/env bash' > $vncXS;
echo "xfce4-session &" >> $vncXS;
}
###
MAIN () {
echo;
ChColors MENU;
TypingS "Welcome To BlanckTerm!" 0.0123; echo;
TypingS "Automatic Configuration Termux By" 0.0123; echo;
ChColors MENUQ;
TypingS "Salar Muhammadi!" 0.0123;
SGR RSGR;
echo;
pingGo; echo; ! [[ "$?" -eq 0 ]] && ChColors FAILED && TypingS "Check Internet Connection and again Enter $aPp" 0.0123 && SGR RSGR && exit 111;
local -i isUp;
! [[ -f $isUpg ]] && fupg && ! [[ -f $isUpg ]] && ChColors FAILED && TypingS "Check System Upgrade Error and again Enter $aPp" 0.0123 && SGR RSGR && exit 222;
! [[ -f $isInsE ]] && insEsse && ! [[ -f $isInsE ]] && ChColors FAILED && TypingS "Check Package install Error and again Enter $aPp" 0.0123 && SGR RSGR && exit 333;
uMotd;
declare -i vncc=0; for vncl in `vncserver -list`; do vncc+=1; done; [[ $vncc -le 8 ]] && vncSetup;
! [[ -f $isCfgE ]] && cfgEsse;
termux-setup-storage;
ChColors SUCCESS;
TypingS "Configuration is Successful! Please Restart the session by CTRL + D and open the app again, Then you can use Desktop Env with a VNC-Viewer app like AVNC if you mind!" 0.0333;
SGR RSGR;
}
MAIN;
