#!/bin/bash
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &

tailscale up --authkey="${TS_AUTHKEY}" --hostname="${TS_HOSTNAME}"

socat TCP4-LISTEN:100,fork,reuseaddr TCP4:${TS_SERVE_ORIGIN} &
if [[ ( "${TS_SERVE_PROTOCOL}" == "http" ) || ( "${TS_SERVE_PROTOCOL}" == "https" ) ]]; then
	tailscale serve ${TS_SERVE_PROTOCOL} / http://127.0.0.1:100
elif [[ ( "${TS_SERVE_PROTOCOL}" == "tcp" ) || ( "${TS_SERVE_PROTOCOL}" == "tls-terminated-tcp" ) ]]; then
	tailscale serve ${TS_SERVE_PROTOCOL}:${TS_SERVE_PORT} tcp://127.0.0.1:100
fi

if [[ -n "${TS_FUNNEL_PORT}" ]]; then
	tailscale funnel ${TS_FUNNEL_PORT} on
fi

tail -f /dev/null