FROM ubuntu:xenial as builder
RUN apt update && \
    apt install -y g++ libace-dev libtbb-dev git cmake \
                libmysqlclient-dev openssl libssl-dev \
                build-essential checkinstall zlib1g-dev && \
    export ACE_ROOT=/usr/include/ace && \
    export TBB_ROOT_DIR=/usr/include/tbb && \
    git clone -b development https://github.com/vmangos/core.git /vmangos/core && \
    mkdir /vmangos/build && cd $_ && \
    cmake /vmangos/core \
    -DDEBUG=0 \
    -DSUPPORTED_CLIENT_BUILD=5875 \
    -DUSE_EXTRACTORS=0 \
    -DCMAKE_INSTALL_PREFIX=/vmangos && \
    make -j4 && make install && \
    rm -rf /var/lib/apt/lists/*

FROM ubuntu:xenial as mangos
LABEL maintainer "xujintao@126.com"

RUN apt update && \
    apt install -y libace-6.3.3 libtbb2 libmysqlclient20 openssl libssl1.0.0 \
                vim && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /vmangos/bin/mangosd /vmangos/bin/
COPY --from=builder /vmangos/etc/mangosd.conf* /vmangos/etc/
CMD ["/bin/bash"]

FROM ubuntu:xenial as realm
LABEL maintainer "xujintao@126.com"

RUN apt update && \
    apt install -y libace-6.3.3 libtbb2 libmysqlclient20 openssl libssl1.0.0 \
                vim && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /vmangos/bin/realmd /vmangos/bin/
COPY --from=builder /vmangos/etc/realmd.conf* /vmangos/etc/
CMD ["/bin/bash"]