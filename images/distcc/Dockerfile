FROM alpine:latest
#RUN apk update && apk upgrade
RUN apk add --no-cache distcc build-base

EXPOSE 3632
ENTRYPOINT [ "/usr/bin/distccd", "--verbose", "--no-detach" ]
