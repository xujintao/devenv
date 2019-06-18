FROM ubuntu:xenial
LABEL maintainer "xujintao@126.com"
RUN set -ex && \
    apt update && \
    apt install -y g++ libace-dev libtbb-dev git cmake \
                libmysqlclient-dev openssl libssl-dev \
                build-essential checkinstall zlib1g-dev \
                gdb vim net-tools iputils-ping tzdata && \
    export ACE_ROOT=/usr/include/ace && \
    export TBB_ROOT_DIR=/usr/include/tbb && \
    git clone -b development https://github.com/vmangos/core.git /vmangos/core && \
    mkdir -p /vmangos/log; \
    mkdir -p /vmangos/build && cd $_ && \
    cmake /vmangos/core \
    -DDEBUG=1 \
    -DSUPPORTED_CLIENT_BUILD=5875 \
    -DUSE_EXTRACTORS=0 \
    -DCMAKE_INSTALL_PREFIX=/vmangos && \
    make -j4 && make install

CMD ["/bin/bash"]