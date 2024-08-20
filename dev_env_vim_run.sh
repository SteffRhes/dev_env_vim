#!/bin/bash

podman run --rm -it -v .:/mount:Z dev_env_vim vim "$@"
