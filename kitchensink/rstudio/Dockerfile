FROM rocker/rstudio:latest
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
         matplotlib \
         ipython \
         jupyter \
         pandas \
         sympy \
         nose \
         scikit-image \
         opencv-python  && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

# Install plantcv and dependencies, only supported under Python 2.x
RUN  pip install opencv-python && cd / &&  git clone https://github.com/danforthcenter/plantcv.git && \
      cd /plantcv && git checkout dev &&  python setup.py install
   

RUN echo "\n\ngit clone https://github.com/terraref/tutorials.git /home/\$USER/tutorials" >> /etc/cont-init.d/conf && \
    echo "\nchown -R \$USER /home/\$USER/tutorials" >> /etc/cont-init.d/conf \
    echo "\nln -s /data/ /home/\$USER/data" >> /etc/cont-init.d/conf

