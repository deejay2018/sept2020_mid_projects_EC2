
#!/bin/bash
sudo -i
yum -y update

#echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk-devel-debug.x86_64
yum install -y git

wget https://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.tar.gz
tar -zvxf apache-tomcat-9.0.38.tar.gz
yum install -y wget
cd apache-tomcat-9.0.38/bin/
chmod +x startup.sh
chmod +x shutdown.sh
./startup.sh

yum update -y
exit

