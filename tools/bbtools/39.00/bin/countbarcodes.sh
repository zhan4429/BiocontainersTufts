#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

VER=39.00
PKG=bbtools
PROGRAM=countbarcodes.sh
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=staphb_bbtools:39.00.sif
ENTRYPOINT_ARGS=""

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
