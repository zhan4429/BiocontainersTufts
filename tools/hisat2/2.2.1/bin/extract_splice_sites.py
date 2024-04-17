#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity/3.8.4 squashfs/4.4
fi

VER=2.2.1
PKG=hisat2
PROGRAM=extract_splice_sites.py
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=quay.io_biocontainers_hisat2:2.2.1--h1b792b2_3.sif
ENTRYPOINT_ARGS="env LANG=C.UTF-8"

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        echo "BIOC: Enabling Nvidia GPU support in the container."
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
