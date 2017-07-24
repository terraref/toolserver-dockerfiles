FROM ndslabs/cloud9-base:latest

RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends \
    gdal-bin  \
    gfortran \
    libfreetype6-dev \
    libhdf5-dev \
    libnetcdf-dev \
    libxft-dev \
    libopenblas-dev \
    liblapack-dev \
    python-dev \
    python-gdal \
    python-matplotlib \
    python-nose \
    python-numpy \
    python-pandas \
    python-scipy \
    python-setuptools \
    python-sympy \
    unzip \
    vim && \
    apt-get -y clean all && \
    easy_install pip && \
    pip install requests &&\ 
    pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose && \
    pip install tika && \
    rm -rf /var/lib/apt/lists/* /tmp/* 

