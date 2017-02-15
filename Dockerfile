FROM ibmcom/informix-developer-database:latest

RUN sudo apt-get update
RUN sudo apt-get install -y openjdk-7-jdk wget

RUN sudo wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -O /apache-ant-1.9.8-bin.tar.gz
# RUN sudo wget http://192.168.0.100:8080/apache-ant-1.9.8-bin.tar.gz -O /apache-ant-1.9.8-bin.tar.gz

ENV INFORMIXDIR /opt/IBM/informix
ENV INFORMIX_HOME /home/informix/

ADD . /home/informix/tc-database-scripts

# add shell script for setup TC db
ADD files/setup_tc_db.sh /setup_tc_db.sh

# modified start and stop scripts
ADD files/informix_start.sh /informix_start.sh
ADD files/informix_stop.sh /informix_stop.sh

# modified onconfig and informix environment vars
ADD files/onconfig.informixoltp_tcp $INFORMIXDIR/etc/onconfig.informixoltp_tcp
ADD files/ifx_informixoltp_tcp.env $INFORMIX_HOME/ifx_informixoltp_tcp.env
RUN echo ". ${INFORMIX_HOME}/ifx_informixoltp_tcp.env" >> ${INFORMIX_HOME}/.bashrc

RUN sudo chmod +x /setup_tc_db.sh
RUN sudo chmod +x /informix_start.sh
RUN sudo chmod +x /informix_stop.sh

RUN sudo chmod -R 777 /home/informix/tc-database-scripts

RUN sudo chown informix: $INFORMIXDIR/etc/onconfig.informixoltp_tcp
RUN sudo chown informix: $INFORMIX_HOME/ifx_informixoltp_tcp.env

RUN sudo tar -xzvf /apache-ant-1.9.8-bin.tar.gz -C /opt
RUN sudo tar -xzvf /home/informix/tc-database-scripts/files/ant-libs.tgz -C /opt/apache-ant-1.9.8/lib
RUN sudo rm /apache-ant-1.9.8-bin.tar.gz
RUN sudo rm -r /home/informix/tc-database-scripts/files

# set locale
ENV DB_LOCALE en_us.utf8
ENV CLIENT_LOCALE en_us.utf8

# setup TC database
RUN ./setup_tc_db.sh

ENTRYPOINT ["/bin/bash", "/informix_start.sh"]
