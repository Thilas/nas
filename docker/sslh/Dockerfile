FROM debian

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install sslh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "sslh", "--foreground" ]
