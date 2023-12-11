FROM alpine:3.19.0

RUN apk --update --no-cache add git aws-cli

COPY entrypoint.sh /entrypoin.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
