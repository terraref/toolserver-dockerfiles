FROM rocker/geospatial:latest
MAINTAINER "Craig Willis" willis8@illinois.edu

RUN install2.r --error \
    GGally \
    RCurl \
    convertr \
    ggthemes \
    ncdf.tools \
    rLiDAR \
    traits 
RUN R -e "devtools::install_github('terraref/traits')"

USER rstudio

USER root
RUN echo "\n\ngit clone https://github.com/terraref/tutorials.git /home/\$USER/tutorials" >> /etc/cont-init.d/conf && \
    echo "\nchown -R \$USER /home/\$USER/tutorials" >> /etc/cont-init.d/conf \
    echo "\nln -s /data/ /home/\$USER/data" >> /etc/cont-init.d/conf

