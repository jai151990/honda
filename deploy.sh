#!/bin/bash
ENVIRONMENT = $1
if [$ENVIRONMENT = "QA" ]; then
  for i in 'cat ip.txt'
    do
      echo "Deploy war file $i:"
      sshpass -p "1234" scp target/ola.war siva@172.17.0.3:/home/siva/soft/apache-tomcat-8.5.32/webapps
      sleep 3
      echo "Start the $i tomcat server"
      sshpass -p "1234" ssh siva@172.17.0.3 "JAVA_HOME=/home/siva/soft/jdk1.8.0_171" "/home/siva/soft/apache-tomcat-8.5.32/bin/./startup.sh"
    done
  echo "Deploy success"
fi
