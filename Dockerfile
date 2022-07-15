FROM alpine:latest

RUN apk update && apk upgrade && apk add xvfb openbox xdotool firefox

COPY scripts/ /capncap/
RUN mkdir -p /capncap/out

CMD "/capncap/capncap_init.sh"
