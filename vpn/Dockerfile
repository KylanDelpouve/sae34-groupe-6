FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y openvpn iproute2 iptables && \
    rm -rf /var/lib/apt/lists/*

COPY server.conf /etc/openvpn/server.conf
COPY secret.key /etc/openvpn/secret.key

CMD ["openvpn", "--config", "/etc/openvpn/server.conf"]
#