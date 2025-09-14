#!/bin/bash

docker login

read -r tag_latest tag_date <<< "$(./dev_env_vim_create_tag.sh)"

echo "$tag_date"
echo "$tag_latest"

docker tag "$tag_date" steffrhes/"$tag_date"
docker tag "$tag_latest" steffrhes/"$tag_latest"

docker push steffrhes/"$tag_date"
docker push steffrhes/"$tag_latest"

