FROM ibmcom/informix-developer-database:latest

RUN sudo apt-get update && sudo apt-get install -y \
    openjdk-7-jdk \
    wget \
    dos2unix \
 && sudo rm -rf /var/lib/apt/lists/*

# Get Apache ant
RUN sudo wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -O /apache-ant-1.9.8-bin.tar.gz
# RUN sudo wget http://192.168.0.100:8080/apache-ant-1.9.8-bin.tar.gz -O /apache-ant-1.9.8-bin.tar.gz

# set directories
ENV INFORMIXDIR /opt/IBM/informix
ENV INFORMIX_HOME /home/informix

ADD . $INFORMIX_HOME/tc-database-scripts

# add shell script for setup TC db
ADD files/setup_env.sh /setup_env.sh
ADD files/setup_tc_db.sh /setup_tc_db.sh

# modified start and stop scripts
ADD files/informix_start.sh /informix_start.sh
ADD files/informix_stop.sh /informix_stop.sh

# modified onconfig and informix environment vars
ADD files/onconfig.informixoltp_tcp $INFORMIXDIR/etc/onconfig.informixoltp_tcp
ADD files/ifx_informixoltp_tcp.env $INFORMIX_HOME/ifx_informixoltp_tcp.env
ADD files/services /etc/services
ADD files/build.properties $INFORMIX_HOME/tc-database-scripts
ADD files/connfile.sql $INFORMIX_HOME/tc-database-scripts

RUN sudo chmod +x /setup_env.sh
RUN sudo chmod +x /setup_tc_db.sh
RUN sudo chmod +x /informix_start.sh
RUN sudo chmod +x /informix_stop.sh

RUN sudo chmod -R 777 /home/informix/tc-database-scripts

RUN sudo chown informix: $INFORMIXDIR/etc/onconfig.informixoltp_tcp
RUN sudo chown informix: $INFORMIX_HOME/ifx_informixoltp_tcp.env

RUN sudo dos2unix $INFORMIX_HOME/tc-database-scripts/build.properties
RUN sudo dos2unix $INFORMIXDIR/etc/onconfig.informixoltp_tcp
RUN sudo dos2unix $INFORMIX_HOME/ifx_informixoltp_tcp.env
RUN sudo dos2unix /etc/services

RUN sudo tar -xzvf /apache-ant-1.9.8-bin.tar.gz -C /opt
RUN sudo tar -xzvf /home/informix/tc-database-scripts/files/ant-libs.tgz -C /opt/apache-ant-1.9.8/lib
RUN sudo rm /apache-ant-1.9.8-bin.tar.gz
RUN sudo rm -r /home/informix/tc-database-scripts/files

RUN echo ". ${INFORMIX_HOME}/ifx_informixoltp_tcp.env" >> $INFORMIX_HOME/.bashrc

# setup TC database
RUN ./setup_env.sh
RUN ./setup_tc_db.sh

ENTRYPOINT ["/bin/bash", "/informix_start.sh"]

# expose informix port
EXPOSE 2021
