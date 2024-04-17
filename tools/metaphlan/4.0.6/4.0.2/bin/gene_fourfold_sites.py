#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

VER=4.0.2
PKG=metaphlan
PROGRAM=gene_fourfold_sites.py
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=biobakery_metaphlan:4.0.2.sif
ENTRYPOINT_ARGS=""

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
