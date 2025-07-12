# Copyright (c) 2021-2025 Shigemi ISHIDA
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM alpine:3.22

ENV LANG=C.UTF-8

RUN set -x && \
    cd / && \
    apk update && \
    apk add --no-cache gcc libc-dev g++ make && \
    rm -rf /var/cache/apk && \
    mkdir /var/cache/apk

WORKDIR /app
CMD ["sh"]