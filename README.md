# docker-limnoria

This is a Dockerfile repository for [Limnoria](https://github.com/ProgVal/Limnoria), an IRC bot based on Supybot. The base is the [official Python image](https://hub.docker.com/_/python/) using the `3.6-alpine` tag (Python 3.6 on Alpine Linux). You'll probably need [Docker](https://www.docker.com/community-edition) to have any real fun.

## Quickstart

If you just want the image an automated build is [available](https://hub.docker.com/r/dpyro/docker-limnoria/) on the Docker Hub. You can simply run:

```shell
docker run -v ~/limnoria:/var/limnoria --rm -it dpyro/docker-limnoria
```

## Build

To create an image tagged `limnoria` in the current directory:

```shell
docker build -t limnoria .
```

## Run

```shell
docker run -v ~/limnoria:/var/limnoria --rm -it limnoria
```

will run a ephemeral container from the `limnoria` image, mounting `~/limnoria` to the data volume located at `/var/limnoria` and connecting a tty.

## Configuration

The startup script will run a configuration (`*.conf`) if it is present. If there are multiple configurations, it will bail out. You will need to configure the bot using the built-in wizard if there is no configuration mounted.
