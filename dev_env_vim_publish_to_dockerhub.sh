#!/bin/bash

docker login

tag_base="steffrhes/dev_env_vim"
tag_latest="$tag_base":latest
tag_date="$tag_base":"$(date -I)"

docker push "$tag_date"
docker push "$tag_latest"

