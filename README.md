# tailscale-serve podman image
it is available at ghcr.io/bitbloxhub/tailscale-serve:latest

the environment variables are:
- `TS_AUTHKEY`: a tailscale authkey. required.
- `TS_HOSTNAME`: the tailscale hostname that it will be available at. required
- `TS_SERVE_ORIGIN`: the original thing that will be served. required.
- `TS_SERVE_PROTOCOL`: the tailscale serve and funnel protocol. either `http`, `https`, `tcp`, or `tls-terminated-tcp`. required
- `TS_SERVE_PORT`: the tailscale serve port. required
- `TS_FUNNEL_PORT`: the tailscale funnel port. without this there will be no funnel. optional.

mount a state directory to /state to keep certificates and stuff