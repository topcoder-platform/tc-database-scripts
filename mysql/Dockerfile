FROM mysql:latest

# container will execute files with extensions .sh, .sql and .sql.gz that are found 
# in /docker-entrypoint-initdb.d in alphabetical order when started for the first time
COPY . /tmp/initdb/
RUN cd /tmp/initdb/ && \
    (cat bugs_oltp/01_bugs_oltp_create.sql;  \
    echo '\nuse bugs_oltp;'; \
    cat bugs_oltp/02_bugs_oltp_schema.sql; \
    cat farm/01_farm_create.sql; \
    echo '\nuse farm;'; \
    cat farm/02_farm_schema_data.sql; ) > /docker-entrypoint-initdb.d/init.sql && \
    rm -rf initdb

# setup root password for mysql
ENV MYSQL_ROOT_PASSWORD=rootpass 

EXPOSE 3306
CMD ["mysqld"]

