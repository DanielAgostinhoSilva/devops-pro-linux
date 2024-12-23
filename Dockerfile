FROM debian:bullseye-slim AS final
# Instalar dependências do runtime
RUN apt-get update && apt-get install -y \
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

WORKDIR /src

ENTRYPOINT [ "tail","-f","/dev/null"]