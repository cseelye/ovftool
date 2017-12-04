FROM ubuntu:16.04
LABEL maintainer=cseelye@gmail.com

ARG OVFTOOL=VMware-ovftool*

COPY [ "$OVFTOOL", "/tmp" ]
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends \
        ca-certificates \
        openssl && \
    /bin/bash -c "ls -l /tmp/" && \
    /bin/bash "$(find /tmp -name "$OVFTOOL" -print -quit)" --eulas-agreed --console --required && \
    apt-get autoremove --assume-yes && \
    apt-get clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/usr/bin/ovftool" ]

