FROM rocker/geospatial:latest
MAINTAINER "Craig Willis" willis8@illinois.edu

#RUN apt-get update -y  && apt-get install -y  default-jre  
#RUN apt-get install -y default-jdk
#RUN apt-get install -y  libbz2-dev
RUN install2.r --error \
    GGally \
    RCurl \
    convertr \
    ggthemes \
    ncdf.tools \
    rLiDAR \
    traits
RUN R -e "devtools::install_github('infotroph/traits@betydb_refactor')"
