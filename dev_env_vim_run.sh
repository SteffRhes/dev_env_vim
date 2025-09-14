#!/bin/bash

#oci_engine="podman"
oci_engine="docker"

"$oci_engine" run --rm -it -v ./:/mount/:z dev_env_vim "$@"

