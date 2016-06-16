FROM informix:base

WORKDIR /home/informix/
ADD . trunk
RUN cp /home/informix/build.properties /home/informix/trunk/
WORKDIR /home/informix/trunk/
RUN oninit && ant setup_db && onmode -ky
WORKDIR /home/informix

EXPOSE 2020/tcp 2021/tcp
CMD oninit -vy && tail -f /opt/IBM/informix/demo/server/online.log
