# FROM resin/rpi-raspbian:jessie
FROM resin/raspberrypi3-node:6.5.0-onbuild

RUN apt-get update && apt-get upgrade -yq

WORKDIR /usr/src/app

# Copies the package.json first for better cache on later pushes
COPY package.json package.json

# gpg keys listed at https://github.com/nodejs/node
# RUN set -ex \
#   && for key in \
#     94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
#     FD3A5288F042B6850C66B31F09FE44734EB7990E \
#     71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
#     DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
#     C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
#     B9AE9905FFD7803F25714661B63B535A4C206CA9 \
#     56730D5401028683275BD23C23EFEFE93C4CFFFE \
#   ; do \
#     gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
#   done

# ENV NPM_CONFIG_LOGLEVEL info
# ENV NODE_VERSION 7.7.2
# ENV NODE_PLATFORM linux-armv7hf

# RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-$NODE_PLATFORM.tar.xz" \
#   && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
#   && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
#   && grep " node-v$NODE_VERSION-$NODE_PLATFORM.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
#   && tar -xJf "node-v$NODE_VERSION-$NODE_PLATFORM.tar.xz" -C /usr/local --strip-components=1 \
#   && rm "node-v$NODE_VERSION-$NODE_PLATFORM.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
#   && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Install npm dependencies on the resin.io build server
RUN npm install --production --unsafe-perm && npm cache clean && rm -rf /tmp/*

# This will copy all files in our root to the working  directory in the container
COPY . ./

# Enable systemd init system in container
ENV INITSYSTEM on

# Run when container starts up on the device
CMD ["npm", "start"]
