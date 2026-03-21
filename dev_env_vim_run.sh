#!/bin/bash

oci_engine="podman"
#oci_engine="docker"

tag_latest="steffrhes/dev_env_vim:latest"

"$oci_engine" run --rm -it -v ./:/v/:z -v ~/main/sys/container/dev_env_vim/spell_files/:/root/.vim/spell/:z "$tag_latest" "$@"

