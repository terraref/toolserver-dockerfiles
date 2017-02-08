FROM jupyter/scipy-notebook

USER root

RUN apt-get update -y && \
    apt-get install -y sqlite3 libopencv-dev python-matplotlib && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN bash -c "source activate python2; conda install opencv -y" && \
    cd / && git clone https://github.com/danforthcenter/plantcv.git && \
    cd /plantcv && git checkout dev && \
    bash -c "source activate python2; python setup.py install" 

USER $NB_USER
RUN cd ~/work && git clone https://github.com/terraref/tutorials.git

CMD ["start-notebook.sh", "--NotebookApp.token=''"]
