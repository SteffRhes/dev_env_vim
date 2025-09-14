#!/bin/bash

docker login

read -r tag_latest tag_date <<< "$(./dev_env_vim_create_tag.sh)"

echo "$tag_date"
echo "$tag_latest"

docker push "$tag_date"
docker push "$tag_latest"

