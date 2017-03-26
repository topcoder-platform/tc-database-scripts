FROM ibmcom/informix-innovator-c:latest

# set environment paths
ENV INFORMIXDIR /opt/IBM/informix
ENV INFORMIX_HOME /home/informix

# install jdk 7, wget and dos2unix
RUN sudo apt-get update && sudo apt-get install -y \
    openjdk-7-jdk \
    wget \
 && sudo rm -rf /var/lib/apt/lists/*
 
# install Apache ant
COPY ant-libs.tgz $INFORMIX_HOME
RUN sudo wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -O /apache-ant-1.9.8-bin.tar.gz && \
    sudo tar -xzvf /apache-ant-1.9.8-bin.tar.gz -C /opt && \
    sudo tar -xzvf $INFORMIX_HOME/ant-libs.tgz -C /opt/apache-ant-1.9.8/lib && \
    sudo rm /apache-ant-1.9.8-bin.tar.gz && \
    sudo rm $INFORMIX_HOME/ant-libs.tgz
	
# change password to 1nf0rm1x
RUN echo "informix:1nf0rm1x" | sudo chpasswd

# add modified onconfig and informix environment vars
ADD onconfig.informixoltp_tcp $INFORMIXDIR/etc/onconfig.informixoltp_tcp
ADD ifx_informixoltp_tcp.env $INFORMIX_HOME/ifx_informixoltp_tcp.env
ADD services /etc/services

RUN sudo chown informix: $INFORMIXDIR/etc/onconfig.informixoltp_tcp
RUN sudo chown informix: $INFORMIX_HOME/ifx_informixoltp_tcp.env

# add modified Informix environment to bash
RUN echo ". ${INFORMIX_HOME}/ifx_informixoltp_tcp.env" >> $INFORMIX_HOME/.bashrc
