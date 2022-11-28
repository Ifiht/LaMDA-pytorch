#!/bin/env bash

conda create -n lamda# python=3.10 mamba -c conda-forge
conda activate lamda#

mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo 'export MAMBA_NO_BANNER=1' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh 

mamba install click cython fabric jupyterlab keras mkl mkl-include ninja numpy packaging pandas pip pre-commit psutil py-cpuinfo pydantic rich scikit-learn=1.1 sentencepiece setuptools tornado tqdm unidecode wrapt

mamba install einops ipywidgets python_abi=3 transformers wandb -c conda-forge
mamba install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
cd $HOME/developer/LaMDA-pytorch/ColossalAI
git checkout 7242bff
pip install -r requirements/requirements.txt
pip install .
pip install nemo_toolkit
pip install deepspeed
