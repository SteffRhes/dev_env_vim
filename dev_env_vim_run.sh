#!/bin/bash

podman run --rm -it -v .:/mount:z dev_env_vim vim "$@"
