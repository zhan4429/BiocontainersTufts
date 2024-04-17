#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity/3.8.4 squashfs/4.4
fi

VER=2.0c
PKG=tmhmm
PROGRAM=tmhmmformat.pl
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=tmhmm_2.0c.sif
ENTRYPOINT_ARGS=""

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        echo "BIOC: Enabling Nvidia GPU support in the container."
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
