FROM jodogne/orthanc-plugins

COPY orthanc.json /etc/orthanc/orthanc.json
COPY auto-index.lua /auto-index.lua
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y postgresql-client procps curl && apt-get clean
ENTRYPOINT [ "/entrypoint.sh" ]
USER root
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x jq-linux64 && mv jq-linux64 /usr/bin/jq
USER ramunerella
CMD [ "/etc/orthanc/" ]
