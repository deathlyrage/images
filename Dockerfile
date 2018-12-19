# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        ubuntu:18.04

LABEL       author="Pterodactyl Software" maintainer="support@pterodactyl.io"

ENV         DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN         apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y tar curl lib32gcc1 ca-certificates p7zip-full libunwind8 icu-devtools openssl liblttng-ust0 libssl1.0.0 libkrb5-3 zlib1g libicu60 libuuid1 \
			gcc g++ lib32gcc1 libgcc1 lib32tinfo5 lib32z1 lib32stdc++6 iproute2 gdb libsdl1.2debian libfontconfig telnet net-tools netcat \
            && useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
