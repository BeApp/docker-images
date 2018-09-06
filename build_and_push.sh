#!/bin/bash

#version=0.1
image_root_name="beappers"
images=(
  php-7.1-fpm
  php-7.1-fpm-xdebug
  engine-7.1
)

#docker login -u $DOCKER_USER -p $DOCKER_PASS

for image in ${images[@]}; do
  echo "Building image $image"

  if [ ! -z $version ]; then
    docker build -t "$image_root_name/$image:$version" "$image"
    docker tag "$image_root_name/$image:$version" "$image_root_name/$image:latest"
  else
    docker build -t "$image_root_name/$image:latest" "$image"
  fi

  echo "Uploading image $image"
  if [ ! -z $version ]; then
    docker push "$image_root_name/$image:$version"
  fi
  docker push "$image_root_name/$image:latest"
done
