FROM jodogne/orthanc-plugins
COPY orthanc.json /etc/orthanc/orthanc.json
COPY auto-index.lua /auto-index.lua
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get install -y postgresql-client procps curl && apt-get clean
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/etc/orthanc/" ]

FROM alpine:3.4
RUN apk --no-cache --update add bash curl less groff jq python py-pip && \
  pip install awscli s3cmd https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz && \
  apk del remove py-pip && \
  mkdir /root/.aws
