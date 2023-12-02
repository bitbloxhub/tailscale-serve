FROM docker.io/archlinux:base-devel
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -S tailscale wget bash socat && \
	wget -O /dinit https://gitlab.com/tozd/dinit/-/releases/v0.3.0/downloads/linux-amd64/dinit && \
	chmod +x /dinit && \
	mkdir -p /etc/service && \
	wget -O /bin/rakdos https://github.com/bitbloxhub/rakdos/releases/download/v1.1.0/rakdos && \
	chmod +x /bin/rakdos
COPY ./etc/service/tailscaled /etc/service/tailscaled
STOPSIGNAL SIGTERM
ENTRYPOINT ["/dinit"]