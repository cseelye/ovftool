FROM ubuntu:16.04
LABEL maintainer=cseelye@gmail.com

ARG OVFTOOL=VMware-ovftool-4.2.0-5965791-lin.x86_64.bundle

COPY [ "$OVFTOOL", "/tmp" ]
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends \
        ca-certificates \
        openssl && \
    /bin/bash "/tmp/$OVFTOOL" --eulas-agreed --console --required && \
    apt-get autoremove --assume-yes && \
    apt-get clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/usr/bin/ovftool" ]

