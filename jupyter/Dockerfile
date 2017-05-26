FROM jupyter/scipy-notebook

USER root

RUN apt-get update -y && \
    apt-get install -y sqlite3 libopencv-dev python-matplotlib && \
    # install a package into the python2 environment
    conda install -n python2 metpy siphon cartopy netcdf4 xarray && \
    # install a package into the default (python 3.x) environment
    conda install metpy siphon cartopy netcdf4 xarray && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN bash -c "source activate python2; conda install opencv -y" && \
    cd / && git clone https://github.com/danforthcenter/plantcv.git && \
    cd /plantcv && git checkout dev && \
    bash -c "source activate python2; python setup.py install" 

USER $NB_USER
COPY start-notebook.sh /usr/local/bin/

CMD ["start-notebook.sh", "--NotebookApp.token=''"]
