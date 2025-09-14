#!/bin/bash

#oci_engine="podman"
oci_engine="docker"

read -r tag_latest tag_date <<< "$(./dev_env_vim_create_tag.sh)"

echo "$tag_date"
echo "$tag_latest"

"$oci_engine" build . -t "$tag_latest"
"$oci_engine" build . -t "$tag_date"

