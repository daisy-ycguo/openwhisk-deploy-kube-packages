FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Initial update and some basics.
# This odd double update seems necessary to get curl to download without 404 errors.
RUN apt-get update --fix-missing && \
  apt-get install -y wget && \
  apt-get update && \
  apt-get install -y curl && \
  apt-get install -y git && \
  apt-get update && \
  apt-get remove -y nodejs && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

COPY installCatalog.sh /installCatalog.sh
RUN chmod +x /installCatalog.sh

CMD ["/installCatalog.sh"]
