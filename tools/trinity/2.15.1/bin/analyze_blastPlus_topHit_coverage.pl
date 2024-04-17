#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity/3.8.4 squashfs/4.4
fi

VER=2.15.1
PKG=trinity
PROGRAM=analyze_blastPlus_topHit_coverage.pl
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=trinityrnaseq_trinityrnaseq:2.15.1.sif
ENTRYPOINT_ARGS="env LANG=C"

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        echo "BIOC: Enabling Nvidia GPU support in the container."
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
