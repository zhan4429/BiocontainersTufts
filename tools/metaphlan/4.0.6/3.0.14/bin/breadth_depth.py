#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

VER=3.0.14
PKG=metaphlan
PROGRAM=breadth_depth.py
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=quay.io_biocontainers_metaphlan:3.0.14--pyhb7b1952_0.sif
ENTRYPOINT_ARGS=""

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
