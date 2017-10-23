FROM rocker/geospatial:3.4.0
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
    leaflet
RUN R -e "devtools::install_github('terraref/traits')"

# Install plantcv and dependencies, only supported under Python 2.x
RUN  pip install -U six opencv-python && cd / &&  git clone https://github.com/danforthcenter/plantcv.git && \
      cd /plantcv && python setup.py install
   
USER rstudio

USER root
RUN echo "\n\n if [ ! -d /home/\$USER/tutorials ]; then\n\t git clone https://github.com/terraref/tutorials.git /home/\$USER/tutorials\nfi\n" >> /etc/cont-init.d/userconf && \
    echo "\nchown -R \$USER /home/\$USER/tutorials" >> /etc/cont-init.d/userconf  && \
    echo "\n if [ ! -d /home\$USER/data ]; then\n\tln -s /data/ /home/\$USER/data\nfi\n" >> /etc/cont-init.d/userconf
    
RUN apt-get update && \
    apt-get install gdebi-core && \\
    wget https://download2.rstudio.org/rstudio-server-1.1.383-amd64.deb && \\
    gdebi -n rstudio-server-1.1.383-amd64.deb
    
