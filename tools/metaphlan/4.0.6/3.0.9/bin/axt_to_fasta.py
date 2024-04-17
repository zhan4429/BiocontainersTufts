#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

VER=3.0.9
PKG=metaphlan
PROGRAM=axt_to_fasta.py
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=depot.galaxyproject.org_singularity_metaphlan%3A3.0.9--pyhb7b1952_0.sif
ENTRYPOINT_ARGS=""

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
