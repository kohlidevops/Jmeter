#To update the package repo
sudo yum update -y
#Install Java
sudo yum install java-17-amazon-corretto -y
# validate java
java -version
# download JMeter 5.5
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.tgz
# download JMeter 5.5 checksum
sha512sum apache-jmeter-5.5.tgz
# validate checksum
if [[ $(cat apache-jmeter-5.5.tgz.sha512 | awk '{print $1}') -eq $(sha512sum apache-jmeter-5.5.tgz | awk '{print $1}') ]] ; then echo "Valid checksum. Proceeding to extract."; else echo "Invalid Checksum, please download it from secured source." ; fi ;
# extracting JMeter
tar -xf apache-jmeter-5.5.tgz
rm apache-jmeter-5.5.tgz
# validate JMeter
cd apache-jmeter-5.5/bin/
./jmeter -v
#Install xauth
sudo yum install xauth -y
export DISPLAY=localhost:10.0
# validate X11 forwarding and it should print `X11Forwarding yes`
sudo cat /etc/ssh/sshd_config | grep X11
