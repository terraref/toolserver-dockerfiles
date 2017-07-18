FROM ndslabs/xpra-base:latest

RUN yum update -q -y && \
    yum install -y java-1.8.0-openjdk openbox xorg-x11-apps xterm && \
    cd / && wget https://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-4.8.1.tgz && \
    tar xvfz PanoplyJ-4.8.1.tgz

COPY entrypoint.sh /
COPY index.html /usr/share/xpra/www
VOLUME /root
EXPOSE 10000

CMD [ "/entrypoint.sh"]
