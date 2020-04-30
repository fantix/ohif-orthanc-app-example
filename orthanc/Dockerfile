FROM jodogne/orthanc-plugins
COPY orthanc.json /etc/orthanc/orthanc.json
COPY auto-index.lua /auto-index.lua
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y postgresql-client procps curl && apt-get clean
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/etc/orthanc/" ]
