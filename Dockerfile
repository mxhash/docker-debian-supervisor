FROM mxhash/debian

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       bash \
       gettext-base \
       supervisor \
    && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf.template /etc/supervisor/supervisord.conf.template
COPY run.sh /run.sh

CMD /bin/bash /run.sh
