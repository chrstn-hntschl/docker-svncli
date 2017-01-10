FROM alpine:latest

MAINTAINER Christian Hentschel <chrstn.hntschl@gmail.com>

RUN apk add --update subversion curl && rm -rf /var/cache/apk/*

# add user svnuser (with userid from build ARG), put user into sudoers
ARG UID=1000
ENV UID=${UID}
RUN useradd -ms /bin/bash -u ${UID} svnuser && "echo:svnuser" | chpasswd && adduser svnuser sudo

VOLUME ["/src"]
WORKDIR /src

ENTRYPOINT ["/usr/bin/svn"]
