FROM appiriodevops/tc-database-scripts:base

ADD . $INFORMIX_HOME/tc-database-scripts
RUN sudo chmod -R 777 /home/informix/tc-database-scripts

# add modified Informix start and stop scripts
ADD files/informix_start.sh /informix_start.sh
ADD files/informix_stop.sh /informix_stop.sh
ADD files/build.properties $INFORMIX_HOME/tc-database-scripts
ADD files/connfile.sql $INFORMIX_HOME/tc-database-scripts
ADD files/setup_tc_db.sh /setup_tc_db.sh

# setup TC database
RUN ./setup_tc_db.sh

ENTRYPOINT ["/bin/bash", "/informix_start.sh"]

# expose informix port
EXPOSE 2021
