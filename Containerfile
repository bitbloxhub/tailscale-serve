FROM alpine:edge
RUN apk update && apk upgrade
RUN apk add --no-cache tailscale tini bash socat
ENTRYPOINT ["/sbin/tini", "--"]
COPY run.sh /run.sh
CMD ["/bin/bash", "/run.sh"]