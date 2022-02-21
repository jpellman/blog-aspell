FROM alpine:3.14
LABEL maintainer "John Pellman <john+github@libjpel.so>"

RUN apk add bash
RUN apk add git
RUN apk add grep
RUN apk add aspell

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
