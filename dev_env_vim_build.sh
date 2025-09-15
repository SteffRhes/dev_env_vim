#!/bin/bash

#oci_engine="podman"
oci_engine="docker"

tag_base="steffrhes/dev_env_vim"
tag_latest="$tag_base":latest
tag_date="$tag_base":"$(date -I)"

"$oci_engine" build . -t "$tag_latest"
"$oci_engine" build . -t "$tag_date"

