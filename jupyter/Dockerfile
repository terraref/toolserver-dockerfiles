FROM jupyter/scipy-notebook:latest

# Install jupyterlab
RUN conda install -c conda-forge jupyterlab && \
    jupyter serverextension enable --py jupyterlab --sys-prefix && \
    # install a package into the python2 environment
    conda install -n python2 metpy siphon cartopy netcdf4 xarray && \
    # install a package into the default (python 3.x) environment
    conda install metpy siphon cartopy netcdf4 xarray

USER $NB_USER

COPY start-notebook.sh /usr/local/bin/

CMD ["start-notebook.sh", "--NotebookApp.token=''"]
