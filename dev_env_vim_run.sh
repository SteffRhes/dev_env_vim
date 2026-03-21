#!/bin/bash

oci_engine="podman"
#oci_engine="docker"

tag_latest="steffrhes/dev_env_vim:latest"

"$oci_engine" run --rm -it -v ./:/v/:z "$tag_latest" "$@"

