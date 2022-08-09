# Setup

Create a folder `.ssh` and run

```sh
ssh-keygen -t rsa -b 4096 -C alias
```

to generate private/public key in the folder. The same key will be used for rebuilding the image.

# Commands

## Build an image from `Dockerfile`

`-t` for tag.

`.` for current directory

```sh
docker build -t minideb .
```

## Running the docker image

`-d` run in detached mode

`-p` Map host port 2222 to 22 in docker for SSH

`-v` Map local directory to a directory in docker, in `host-path:container-path` pattern

`--name` Give this instance a name

```sh
docker run -d -p 2222:22 --name vscode -v ~/docker-volumes/workspace:/home/dev/workspace minideb
```

## Stopping the container and removing the instance
```sh
docker stop vscode | xargs docker rm
```

## Deleting the image
```sh
docker rmi minideb
```