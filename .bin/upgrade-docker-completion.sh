#!/bin/sh

version=$(docker-compose --version | grep -oP "\d+(\.\d+)+")
echo "docker-compose version: $version"

mkdir "$HOME/.bash_completion"
curl "https://raw.githubusercontent.com/docker/compose/$version/contrib/completion/bash/docker-compose" -o "$HOME/.bash_completion/docker-compose"

