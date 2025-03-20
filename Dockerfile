ARG ARCH=armv7hf
ARG VERSION=12.1.0
ARG UBUNTU_VERSION=24.04
ARG REPO=axisecp
ARG SDK=acap-native-sdk

FROM ${REPO}/${SDK}:${VERSION}-${ARCH}-ubuntu${UBUNTU_VERSION}

COPY build.sh /build.sh

WORKDIR /opt/app

CMD ["/build.sh"]