# pman0214/alpine-gcc

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> C development environment with GCC on Alpine Linux

Source code is available on [GitHub](https://github.com/pman0214/docker_alpine-gcc).
Docker images are available for x86_64 (amd64) and aarch64 (arm64) on [Docker Hub](https://hub.docker.com/r/pman0214/alpine-gcc), which are automatically built with GitHub Actions.

## Table of Contents

- [pman0214/alpine-gcc](#pman0214alpine-gcc)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
  - [Usage](#usage)
  - [Building](#building)
  - [Contribute](#contribute)
  - [Copyright, License](#copyright-license)

## Install

```bash
docker pull pman0214/alpine-gcc
```

## Usage

Default `WORKDIR` is `/app`.

```bash
docker run --rm -v $PWD:/app pman0214/alpine-gcc gcc -Wall -o hoge hoge.c
docker run --rm -v $PWD:/app pman0214/alpine-gcc ./hoge
```

You can all combine compile and run commands.
```bash
docker run --rm -v $PWD:/app pman0214/alpine-gcc sh -c "gcc -Wall -o hoge hoge.c && ./hoge"
```


## Building

If you want to build this image by yourself, please prepare for a multi-architecture builder referring to the [official documents](https://docs.docker.com/desktop/multi-arch/).
```bash
docker run --privileged --rm tonistiigi/binfmt --uninstall "qemu-*"
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --name multiarch --driver docker-container
docker buildx use multiarch
docker buildx inspect --bootstrap
```
In this example, `multiarch` is the name of the multi-architecture builder.

You can build this image with your own multi-architecture builder.
```bash
docker buildx build \
  --platform linux/amd64,linux/arm64,linux/arm/v7 \
  -t "alpine-gcc" \
  . --load
```
`--push` option instead of `--load` with appropriate tag pushes built images to GitHub.

## Contribute

* Bugfix pull requests are welcome.

## Copyright, License

All the source files are released under the MIT license. See `LICENSE.txt`.

* Copyright (c) 2021-2025 Shigemi ISHIDA
