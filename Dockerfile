FROM  mvance/unbound:1.9.3
LABEL maintainer "mi2428 <tmiya@protonmail.ch>"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      rsyslog vim procps \
 && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

CMD rsyslogd && /unbound.sh
