FROM kalilinux/kali

RUN apt-get update && apt-get install metasploit-framework vim openvpn nmap gobuster enum4linux hydra -y
RUN mkdir /opt/scripts
RUN git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/scripts/peas
RUN apt-get install dirbuster dirb dnsmap wfuzz sqlmap wordlists -y
RUN apt-get install nano netcat fdisk man -y
RUN apt-get install tmux openssh-server -y
RUN mkdir /opt/sources
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip3 install uncompyle6
ADD ./config/.bashrc /root/.bashrc
RUN apt-get install libssl-dev lzip m4 libc6-dev-i386 libgmp3-dev steghide -y
RUN apt-get install remmina -y
RUN git clone https://github.com/rebootuser/LinEnum.git /opt/scripts/linenum
RUN cd /usr/share/wordlists && gzip -d rockyou.txt.gz
RUN apt-get install nikto -y
RUN apt-get install inetutils-ping -y
RUN apt-get install traceroute whois dnsutils -y
RUN apt-get install telnet tcpdump ftp exploitdb -y
RUN git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/scripts/powersploit
RUN git clone https://github.com/samratashok/nishang.git /opt/scripts/nishang
RUN git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git /opt/scripts/suggest-windows-exploit
RUN apt-get install aircrack-ng -y
RUN pip3 install xlrd --upgrade
RUN apt-get install sqlite3 -y
RUN apt-get install smbmap -y
RUN apt-get install joomscan -y
RUN apt-get install exiftool -y
ADD scripts/* /opt/scripts
ADD lists/* /opt/lists
RUN apt-get install software-properties-common -y
RUN apt-get install wpscan binwalk -y
ENTRYPOINT /bin/bash