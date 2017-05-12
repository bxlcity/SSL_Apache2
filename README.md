# SSL_Apache2
Simple Script To Create a SSL Certificate on Apache for Debian

cd /tmp && git clone https://github.com/bxlcity/SSL_Apache2.git /n
cd SSL_Apache2 && chmod 777 InstallSLL.sh /n
./InstallSLL.sh /n

If you are error when you restart service Apache2 maybe vmware use port 443 find port and kill
netstat -plan | grep :443
kill ...

Tested on Kali & Parrot
