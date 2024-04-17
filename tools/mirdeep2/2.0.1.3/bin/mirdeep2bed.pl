#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity/3.8.4 squashfs/4.4
fi

VER=2.0.1.3
PKG=mirdeep2
PROGRAM=mirdeep2bed.pl
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=quay.io_biocontainers_mirdeep2:2.0.1.3--hdfd78af_0.sif
ENTRYPOINT_ARGS="env LANG=C.UTF-8"

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        echo "BIOC: Enabling Nvidia GPU support in the container."
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
