if [[ ! -f /var/lock/msfdb_setup ]]
then
    sudo service postgresql start && msfdb init
    touch /var/lock/msfdb_setup
fi