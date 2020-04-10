# Because One is Not Enough

At a command prompt or terminal:

``` Bash
conda create --name Viz python=3.7 anaconda
conda activate Viz
conda install -c pyviz holoviz
conda install -c pyviz panel
conda install -c plotly plotly=4.6.0
conda install -c pyviz hvplot
```

Then:

``` Bash
# Avoid "JavaScript heap out of memory" errors during extension installation
# (OS X/Linux)
export NODE_OPTIONS=--max-old-space-size=4096
# (Windows)
set NODE_OPTIONS=--max-old-space-size=4096
jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1 --no-build
jupyter labextension install jupyterlab-plotly@4.6.0 --no-build
jupyter labextension install plotlywidget@4.6.0 --no-build
jupyter labextension install @pyviz/jupyterlab_pyviz --no-build
jupyter lab build
```

Afterwards:

``` Bash
# Unset NODE_OPTIONS environment variable
# (OS X/Linux)
unset NODE_OPTIONS
# (Windows)
set NODE_OPTIONS=
```

Then:

``` Bash
conda install -c conda-forge nodejs

conda install -c pyviz geoviews
pip install plaid-python
pip install alpaca-trade-api
```

And to create the kernel for VS Code we need:

``` Bash
python -m ipykernel install --user --name Viz --display-name "Python (Viz)"
```
