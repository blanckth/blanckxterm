export DISPLAY="localhost:0";
vncserver -list;
alias vnc='vncserver :13 -name blanckxterm';
alias vncl='vncserver -list';
alias vnck='killall Xvnc; rm -rf /root/.vnc/localhost:*.pid;';