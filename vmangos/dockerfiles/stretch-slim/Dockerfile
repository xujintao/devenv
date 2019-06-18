FROM debian:stretch-slim as builder
RUN set -ex; \
    \
    fetchDeps=" \
        ca-certificates \
        g++ \
        libace-dev \
        libtbb-dev \
        git \
        cmake \
        libmariadbclient-dev \
        openssl \
        libssl-dev \
        build-essential \
        checkinstall \
        zlib1g-dev \
    "; \
    apt update; \
    apt install -y --no-install-recommends $fetchDeps; \
    rm -rf /var/lib/apt/lists/*; \
    \
    export ACE_ROOT=/usr/include/ace; \
    export TBB_ROOT_DIR=/usr/include/tbb; \
    git clone -b development https://github.com/vmangos/core.git /vmangos/core; \
    mkdir /vmangos/build && cd $_; \
    cmake /vmangos/core \
    -DDEBUG=0 \
    -DSUPPORTED_CLIENT_BUILD=5875 \
    -DUSE_EXTRACTORS=0 \
    -DCMAKE_INSTALL_PREFIX=/vmangos; \
    make -j4 && make install

FROM debian:stretch-slim as mangosd
LABEL maintainer "xujintao@126.com"

RUN set -ex; \
    \
    fetchDeps=" \
        libace-6.3.3 \
        libtbb2 \
        libmariadbclient18 \
        openssl \
        libssl1.1 \
        vim \
        tzdata \
    "; \
    apt update; \
    apt install -y --no-install-recommends $fetchDeps; \
    rm -rf /var/lib/apt/lists/*; \
    \
    mkdir /vmangos/log

COPY --from=builder /vmangos/bin/mangosd /vmangos/bin/
COPY --from=builder /vmangos/etc/mangosd.conf* /vmangos/etc/
ENTRYPOINT ["/vmangos/bin/mangosd"]

FROM debian:stretch-slim as realmd
LABEL maintainer "xujintao@126.com"

RUN set -ex; \
    \
    fetchDeps=" \
        libace-6.3.3 \
        libtbb2 \
        libmariadbclient18 \
        openssl \
        libssl1.1 \
        vim \
        tzdata \
    "; \
    apt update; \
    apt install -y --no-install-recommends $fetchDeps; \
    rm -rf /var/lib/apt/lists/*; \
    \
    mkdir /vmangos/log

COPY --from=builder /vmangos/bin/realmd /vmangos/bin/
COPY --from=builder /vmangos/etc/realmd.conf* /vmangos/etc/
ENTRYPOINT ["/vmangos/bin/realmd"]