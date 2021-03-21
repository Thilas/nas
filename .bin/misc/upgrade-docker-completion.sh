#!/bin/sh
home="${1:-$HOME}"

version="$(\docker-compose --version | grep -oP '\d+(\.\d+)+')"
echo "docker-compose version: $version"

mkdir -p "$home/.bash_completion"
curl "https://raw.githubusercontent.com/docker/compose/$version/contrib/completion/bash/docker-compose" -o "$home/.bash_completion/docker-compose"
. "$home/.bash_completion/docker-compose"
