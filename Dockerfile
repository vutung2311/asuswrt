FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
        git \
        ccache \
        lzma-dev \
        liblzma-dev \
        qemu \
        u-boot-tools \
        gtk-doc-tools \
        uuid-dev \
        cmake \
        libglib2.0-dev \
        build-essential \
        liblzo2-dev \
        xsltproc \
        libstdc++5 \
        patch \
        gperf \
        lzma \
        binutils-dev \
        libncurses5 \
        intltool \
        docbook-xsl-* \
        autoconf \
        autopoint \
        libncurses5-dev \
        m4 \
        bc \
        bison \
        gawk \
        flex \
        device-tree-compiler \
        gengetopt \
        zlib1g-dev \
        mtd-utils \
        shtool \
        autogen \
        texinfo \
        python-minimal \
        dos2unix \
        libtool \
        libtool-bin \
        lib32z1 \
        lib32stdc++6 \
        libc6-i386 \
        lib32ncurses5 \
        libc6-dev-i386

ADD tools/openwrt-gcc463.arm.tar.bz2 /opt
ENV PATH "/opt/openwrt-gcc463.arm/bin:${PATH}"
ENV STAGING_DIR "/opt/openwrt-gcc463.arm"

ENTRYPOINT [ "/bin/bash" ]
CMD [ "-" ]