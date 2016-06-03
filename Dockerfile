FROM mxhash/debian-base:jessie-backports

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD supervisor/supervisord.conf /etc/supervisor/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/supervisord.conf", "-n"]
