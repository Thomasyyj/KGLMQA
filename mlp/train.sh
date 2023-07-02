#!/bin/sh
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH --partition=PGR-Standard
#SBATCH --gres=gpu:2
#SBATCH --mem=20000  # memory in Mb
#SBATCH --time=1-00:00:00

export CUDA_HOME=/opt/cuda-11.3/

export CUDNN_HOME=/opt/cuDNN-7.0/

export STUDENT_ID=$(whoami)

export LD_LIBRARY_PATH=${CUDNN_HOME}/lib64:${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export LIBRARY_PATH=${CUDNN_HOME}/lib64:$LIBRARY_PATH

export CPATH=${CUDNN_HOME}/include:$CPATH

export LD_LIBRARY_PATH="/home/s2439997/miniconda3/envs/xjj/lib:$LD_LIBRARY_PATH"

export PATH=${CUDA_HOME}/bin:${PATH}

export PYTHON_PATH=$PATH

mkdir -p /disk/scratch/${STUDENT_ID}


export TMPDIR=/disk/scratch/${STUDENT_ID}/
export TMP=/disk/scratch/${STUDENT_ID}/

mkdir -p ${TMP}/datasets/
export DATASET_DIR=${TMP}/datasets/
# Activate the relevant virtual environment:

export CUDA_VISIBLE_DEVICES=0,1
#export CUDA_VISIBLE_DEVICES=0

export TOKENIZERS_PARALLELISM=true


source /home/${STUDENT_ID}/miniconda3/bin/activate xjj

CUDA_VISIBLE_DEVICES=0,1 ./run_greaselm.sh csqa --data_dir data/
