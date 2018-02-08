FROM terraref/terrautils:latest

ARG java_version=8

# Install NodeJS, Python/pip, JDK, Octave/less, make/gcc/g++
RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends \
	ant \
	build-essential \
	curl \
        ca-certificates \
        gcc \
        g++ \
        gdb \
        gdbserver \
    	gdal-bin  \
        gfortran \
	git \
	less \
        libxft-dev \
	lsof \
	maven \
	nodejs \
	octave \
        openjdk-${java_version}-jdk \
	python \
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
        easy_install pip && \
        pip install --upgrade pip &&\ 
        pip install requests &&\ 
        pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose && \
        pip install tika && \
        apt-get autoclean && \
        apt-get autoremove && \
        apt-get -y clean all && \
        rm -rf /var/lib/apt/lists/* /tmp/* 

# Install Cloud9 from source
RUN git clone --depth 1 --single-branch https://github.com/c9/core.git /cloud9
WORKDIR /cloud9
RUN scripts/install-sdk.sh

# Configure Cloud9
RUN C9_DIR=$HOME/.c9 && PATH="$C9_DIR/node/bin/:$C9_DIR/node_modules/.bin:$PATH" && cd $C9_DIR && npm install pty.js
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js 

# Add a user/group for cloud9
RUN useradd cloud9 && \
    mkdir /workspace && \
    chown cloud9:cloud9 /workspace && \
    addgroup cloud9 staff 

VOLUME /workspace
EXPOSE 80
CMD ["nodejs", "/cloud9/server.js", "-p", "80", "-w", "/workspace", "-a", ":", "--listen", "0.0.0.0" ]
