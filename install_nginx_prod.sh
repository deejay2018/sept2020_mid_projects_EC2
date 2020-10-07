
#!/bin/bash
sudo yum -y update

sudo yum remove -y java
sudo yum install -y java-1.8.0-openjdk-devel-debug.x86_64
sudo yum install -y git
sudo amazon-linux-extras install nginx1 -y
sudo yum update -y
sudo service nginx start



