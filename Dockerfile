FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install metasploit-framework vim openvpn nmap gobuster enum4linux hydra -y
RUN mkdir /opt/scripts
RUN git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/scripts/peas
RUN apt-get install dirbuster dirb dnsmap wfuzz sqlmap wordlists -y
RUN apt-get install python -y
RUN apt-get install nano netcat fdisk man -y

ENTRYPOINT /bin/bash