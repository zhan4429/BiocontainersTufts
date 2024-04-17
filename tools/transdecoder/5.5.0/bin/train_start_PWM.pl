#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity/3.8.4 squashfs/4.4
fi

VER=5.5.0
PKG=transdecoder
PROGRAM=train_start_PWM.pl
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=quay.io_biocontainers_transdecoder:5.5.0--pl5321hdfd78af_5.sif
ENTRYPOINT_ARGS=""

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        echo "BIOC: Enabling Nvidia GPU support in the container."
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
