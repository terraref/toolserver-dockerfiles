FROM rocker/geospatial:latest
MAINTAINER "Craig Willis" willis8@illinois.edu

RUN apt-get update -y &&  \
    apt-get install -y -qq \
         python2.7-dev \
         python3-dev \
         python3-pip \
         sqlite3 \
         libopencv-dev \
         python-matplotlib  && \
    easy_install pip && \
    pip install \
         numpy \
         scipy \
         matplotlib \
         ipython \
         jupyter \
         pandas \
         sympy \
         nose \
         scikit-image \
         opencv-python  && \
    pip3 install \
         numpy \
         scipy \
         matplotlib  && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

RUN install2.r --error \
    GGally \
    RCurl \
    convertr \
    ggthemes \
    ncdf.tools \
    rLiDAR \
    traits
RUN R -e "devtools::install_github('terraref/traits')"

# Install plantcv and dependencies, only supported under Python 2.x
RUN  pip install -U six opencv-python && cd / &&  git clone https://github.com/danforthcenter/plantcv.git && \
      cd /plantcv && git checkout dev &&  python setup.py install
   
USER root

RUN echo "\n\n if [ ! -d /home/rstudio/tutorials ]; then\n\t git clone https://github.com/terraref/tutorials.git /home/rstudio/tutorials\nfi\n" >> /etc/cont-init.d/conf && \
    echo "\nchown -R rstudio /home/rstudio/tutorials" >> /etc/cont-init.d/conf \
    echo "\n if [ ! -d /home/rstudio/data ]; then\n\tln -s /data/ /home/rstudio/data\nfi\n" >> /etc/cont-init.d/conf
