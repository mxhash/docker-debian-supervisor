FROM mxhash/debian-base:jessie-backports

ARG DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD supervisor/supervisord.conf /etc/supervisor/supervisord.conf

COPY docker-entrypoint.sh /usr/local/bin

ENV SUPERVISOR          "supervisord"
ENV SUPERVISOR_CONFIG   "/etc/supervisor/supervisord.conf"
ENV SUPERVISOR_SLEEP    "10"
ENV SUPERVISOR_ARGS     ""

CMD docker-entrypoint.sh

