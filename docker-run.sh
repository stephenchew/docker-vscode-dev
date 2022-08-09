#!/bin/bash

docker run -d -p 2222:22 --name vscode -v ~/docker-volumes/workspace:/home/dev/workspace minideb

