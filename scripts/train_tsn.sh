#!/usr/bin/env bash

DATASET=$1
MODALITY=$2
SPLIT=${3:-1}

CAFFE_PATH="../libs/caffe-action/build/install/bin"
LOG_FILE="logs/train_${DATASET}_split_${SPLIT}_${MODALITY}.log"

N_GPU=2
MPI_BIN_DIR=/usr/local/bin/

echo "logging to ${LOG_FILE}"

# ${MPI_BIN_DIR}mpirun -np $N_GPU \
$CAFFE_PATH/caffe train \
    --solver=prototxt/${DATASET}/tsn_bn_inception_${MODALITY}_solver_split_${SPLIT}.prototxt  \
    --weights=models/init/bn_inception_${MODALITY}_init.caffemodel \
    2>&1 | tee ${LOG_FILE}
