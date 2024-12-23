FROM debian:bullseye AS final
# Instalar dependências do runtime
RUN apt-get update && apt-get install -y \
    man-db \
    procps \
    ca-certificates \
    tzdata \
    bash \
    make \
    python3 \
    unzip \
    gcc \
    g++ \
    scons \
    && apt-get clean

RUN apt-get update && apt-get install -y procps && free -h

WORKDIR /src

ENTRYPOINT [ "tail","-f","/dev/null"]