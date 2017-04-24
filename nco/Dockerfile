FROM ubuntu:xenial


RUN apt-get update -y && \
    apt-get install -y \
        antlr \
        aptitude \
        bison \ 
        build-essential \
        emacs \
        flex \ 
        gdb \
        git \
        gsl-bin \
        libexpat1-dev \
        libgsl2 \
        libgsl-dev \
        libantlr-dev \
        libhdf5-serial-dev \
        libnetcdf-dev \
        m4 \
        netcdf-bin \
        pax \
        vim \
        wget 
RUN     cd /usr/local/src && \ 
        wget ftp://ftp.unidata.ucar.edu/pub/udunits/udunits-2.2.24.tar.gz && \
        gunzip -c udunits-2.2.24.tar.gz   | pax -r && \
        cd udunits-2.2.24 && ./configure && make install && make clean 

RUN     cd /usr/local/src && \
        wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.0-patch1/src/hdf5-1.10.0-patch1.tar.gz && \
        tar xvfz hdf5-1.10.0-patch1.tar.gz  && \
        cd hdf5-1.10.0-patch1 && ./configure --prefix=/usr/local && make install && make clean && \
        cd /usr/local/src 

RUN     wget https://github.com/Unidata/netcdf-c/archive/v4.4.1.1.tar.gz -O netcdf-v4.4.1.1.tar.gz && \
        tar xvfz netcdf-v4.4.1.1.tar.gz && \
        cd netcdf-c-4.4.1.1/ && ./configure --prefix=/usr/local/  && make install && make clean && \
        cd /usr/local/src 

RUN     wget https://github.com/nco/nco/archive/4.6.6.tar.gz -O nco-4.6.6.tar.gz && \
        tar xvzf nco-4.6.6.tar.gz && cd nco-4.6.6/ && \
        ./configure --enable-static --enable-shared --enable-udunits2 --disable-udunits --enable-gsl --enable-ncoxx --enable-netcdf4 --enable-regex --disable-dap && \
        make install && make clean

RUN     apt-get install -y nodejs npm libcurl4-gnutls-dev && \
        cd / && git clone https://github.com/krishnasrinivas/wetty.git  && \
        cd wetty && npm cache clean -f && npm install -g n &&  n 4.4.5 && npm install npm -g &&  npm uninstall node-gyp -g && npm install

RUN     apt-get install -y  python-numpy python-scipy python-matplotlib python-netcdf4

EXPOSE 3000
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT entrypoint.sh
