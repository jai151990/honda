#!/bin/bash
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ]; then
  for i in `cat ip.txt`
    do
      echo "deploye war file into $i "
      sleep 3
      sshpass -p "1234" scp target/companybank.war priya@$i:/home/priya/soft/apache-tomcat-8.5.32/webapps

      echo "starting tomcat server $i"
      sshpass -p "1234" ssh priya@$i "JAVA_HOME=/home/priya/soft/jdk1.8.0_171" "/home/priya/soft/apache-tomcat-8.5.32/bin/./startup.sh"
    done
  echo "deploy success"
fi
