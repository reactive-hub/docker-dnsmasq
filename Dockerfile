FROM debian:wheezy

ENV DNSMASQ_VERSION 2.62-3+deb7u1
ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
    && apt-get update -qq \
    && apt-get install -qq --no-install-recommends dnsmasq=${DNSMASQ_VERSION} \
    && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 53 53/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dnsmasq"]
