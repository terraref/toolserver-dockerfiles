FROM rocker/rstudio:latest
MAINTAINER "Craig Willis" willis8@illinois.edu

RUN echo "\n\ngit clone https://github.com/terraref/tutorials.git /home/\$USER/tutorials" >> /etc/cont-init.d/conf && \
    echo "\nchown -R \$USER /home/\$USER/tutorials" >> /etc/cont-init.d/conf
