FROM registry.itsocks.de/library/debian-base:stretch

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        supervisor \
    && rm -rf /var/lib/apt/lists/*

ADD supervisor/supervisord.conf /etc/supervisor/supervisord.conf

ADD entrypoint.sh /entrypoint.sh

ENV SUPERVISOR supervisord
ENV SUPERVISOR_CONFIG /etc/supervisor/supervisord.conf
ENV SUPERVISOR_SLEEP 10
ENV SUPERVISOR_ARGS=""

CMD ["/entrypoint.sh"]
