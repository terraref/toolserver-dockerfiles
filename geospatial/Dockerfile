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
RUN R -e "devtools::install_github('infotroph/traits@betydb_refactor')"
