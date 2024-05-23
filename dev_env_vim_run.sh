#!/bin/bash

podman run --rm -it -v .:/mount:rw dev_env_vim vim "$@"
