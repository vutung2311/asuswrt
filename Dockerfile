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
ADD tools/openwrt-gcc540.arm.tar.xz /opt
ENV PATH "/opt/openwrt-gcc540.arm/bin:${PATH}"
ENV STAGING_DIR "/opt/openwrt-gcc540.arm"

RUN ln -sf /opt/openwrt-gcc540.arm/lib/libuClibc-1.0.14.so /opt/openwrt-gcc540.arm/lib/libresolv.so.0 && \
    ln -sf /opt/openwrt-gcc540.arm/lib/libuClibc-1.0.14.so /opt/openwrt-gcc540.arm/lib/libresolv.so && \
    ln -sf /opt/openwrt-gcc540.arm/lib/libuClibc-1.0.14.so /opt/openwrt-gcc540.arm/lib/libnsl.so.0 && \
    ln -sf /opt/openwrt-gcc540.arm/lib/libuClibc-1.0.14.so /opt/openwrt-gcc540.arm/lib/libnsl.so

ENTRYPOINT [ "/bin/bash" ]
CMD [ "-" ]