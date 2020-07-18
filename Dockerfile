FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install metasploit-framework vim openvpn nmap gobuster enum4linux hydra -y
RUN mkdir /opt/scripts
RUN git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/scripts/peas
RUN apt-get install dirbuster dirb dnsmap wfuzz sqlmap wordlists -y
RUN apt-get install python -y
RUN apt-get install nano netcat fdisk man -y
RUN apt-get install tmux openssh-server -y
RUN mkdir /opt/sources
RUN curl https://bootstrap.pypa.io/get-pip.py -o /opt/sources/get-pip.py
RUN python /opt/sources/get-pip.py
RUN pip install uncompyle6
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
RUN pip install xlrd --upgrade
RUN apt-get install sqlite3 -y
ENTRYPOINT /bin/bash