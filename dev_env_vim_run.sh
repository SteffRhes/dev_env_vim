#!/bin/bash

#oci_engine="podman"
oci_engine="docker"

read -r tag_latest tag_date <<< "$(./dev_env_vim_create_tag.sh)"

"$oci_engine" run --rm -it -v ./:/mount/:z "$tag_latest" "$@"

