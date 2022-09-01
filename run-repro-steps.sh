#!/usr/bin/env bash

echo building containers

docker build -t turbo-git-issue:latest -f ./Dockerfile.git-latest .
docker build -t turbo-git-issue:2.17.1 -f ./Dockerfile.git-2-17 .

echo Testing Git 2.17.1
docker run -t -v "$PWD:$PWD" -w $PWD turbo-git-issue:2.17.1

echo Testing Latest Git

docker run -t -v "$PWD:$PWD" -w $PWD turbo-git-issue:latest
