FROM jodogne/orthanc-plugins
COPY orthanc.json /etc/orthanc/orthanc.json
COPY auto-index.lua /auto-index.lua
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y postgresql-client procps curl && apt-get clean
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/etc/orthanc/" ]

FROM ubuntu:14.04

RUN apt-get -y -qq update && \
	apt-get install -y -qq curl && \
	apt-get clean
#
# install jq to parse json within bash scripts
RUN curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq && \
  chmod +x /usr/local/bin/jq

# Define working directory.
WORKDIR /data

CMD ["-"]
ENTRYPOINT ["jq"]
