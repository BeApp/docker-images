#!/bin/bash

# You should login first by using : docker login -u $DOCKER_USER -p $DOCKER_PASS

version=0.1
image_root_name="beappers"
images=(
  php-7.1-fpm
  php-7.1-fpm-xdebug
  engine-7.1
  logzio-filebeat
)

function build() {
  image=$1
  version=$2

  if [[ ! -z ${version} ]]; then
    echo "Building image $image with version $version"
    docker build -t "$image_root_name/$image:$version" "$image"
    docker tag "$image_root_name/$image:$version" "$image_root_name/$image:latest"
  else
    echo "Building image $image"
    docker build -t "$image_root_name/$image:latest" "$image"
  fi
}

function upload() {
  image=$1
  version=$2

  echo "Uploading image $image"
  if [[ ! -z ${version} ]]; then
    docker push "$image_root_name/$image:$version"
  fi
  docker push "$image_root_name/$image:latest"
}

for image in ${images[@]}; do
  build "$image" "$version"
  upload "$image" "$version"
done
