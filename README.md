# SSL_Apache2
Simple Script To Create a SSL Certificate on Apache for Debian

![SSL_Apache2](https://i.imgur.com/XzX8pfp.png)

cd /tmp && git clone https://github.com/bxlcity/SSL_Apache2.git

cd SSL_Apache2 && chmod 777 InstallSLL.sh

./InstallSLL.sh

If you are error when you restart service Apache2 maybe vmware use port 443 find port and kill

netstat -plan | grep :443

kill ...

Tested on Kali & Parrot & vagrant 'hashicorp/precise64'

![SSL_Apache2](https://i.imgur.com/drgYg7C.png)
