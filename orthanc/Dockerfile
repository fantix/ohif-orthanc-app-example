FROM jodogne/orthanc-plugins
COPY orthanc.json /etc/orthanc/orthanc.json
COPY auto-index.lua /auto-index.lua
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y postgresql-client procps curl && apt-get clean
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/etc/orthanc/" ]

FROM jenkins/jenkins:2.298
USER root
RUN set -xe && apt-get update && apt-get install -y apt-utils dnsutils python python-setuptools python-dev python-pip python3 python3-pip python3-venv build-essential zip unzip jq less vim gettext-base
USER ramunerella
