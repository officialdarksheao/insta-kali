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
RUN git clone https://github.com/rebootuser/LinEnum.git /opt/script/LinEnum
RUN cd /usr/share/wordlists && gzip -d rockyou.txt.gz
ENTRYPOINT /bin/bash