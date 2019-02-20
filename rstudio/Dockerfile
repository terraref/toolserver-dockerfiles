FROM rocker/geospatial:3.4.2
MAINTAINER "Craig Willis" willis8@illinois.edu

# The specific opencv-python version is needed by the plantcv install
RUN apt-get update -y &&  \
    apt-get remove -y python && \
    apt-get install -y -qq \
         cron \
         emacs-nox \
         imagemagick \
         python3-dev \
         python3-pip \
         unixodbc-dev \
         odbc-postgresql \
         sqlite3 \
         libopencv-dev \
         libsqliteodbc \
         nco \
         python-matplotlib  \
         python-gdal && \
    pip3 install \
         opencv-python==3.4.5.20 \
         pandas \
         ipython \
         jupyter \
         sympy \
         nose \
         scikit-image \
         numpy \
         scipy \
         matplotlib  \
         scikit-image \
         terrautils && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

RUN install2.r --error \
    GGally \
    RCurl \
    convertr \
    ggthemes \
    ncdf.tools \
    ncdf4 \
    rLiDAR \
    leaflet \
    shinythemes 
RUN R -e "devtools::install_github('yihui/xfun')"
RUN R -e "devtools::install_github('rstudio/blogdown')"
RUN R -e "devtools::install_github('terraref/traits')"
RUN R -e "install.packages('dbplyr', repos = 'https://cloud.r-project.org')"
RUN R -e "devtools::install_github('rstats-db/odbc')"
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("EBImage")'

# Install plantcv and dependencies
RUN  pip3 install -U six && cd / &&  git clone https://github.com/danforthcenter/plantcv.git && \
      cd /plantcv && python3 setup.py install
   
USER rstudio

USER root
RUN echo "\n\n if [ ! -d /home/\$USER/tutorials ]; then\n\t git clone https://github.com/terraref/tutorials.git /home/\$USER/tutorials\nfi\n" >> /etc/cont-init.d/userconf && \
    echo "\nchown -R \$USER /home/\$USER/tutorials" >> /etc/cont-init.d/userconf  && \
    echo "\n if [ ! -d /home\$USER/data ]; then\n\tln -s /data/ /home/\$USER/data\nfi\n" >> /etc/cont-init.d/userconf