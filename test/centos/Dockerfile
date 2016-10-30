FROM centos:centos7

MAINTAINER Wei Fu <wei.fu.1218@gmail.com>

# Enable EPEL and Cabal Repositories
RUN yum -y install epel-release.noarch \
    http://dl.fedoraproject.org/pub/epel/7/SRPMS/c/cabal-install-1.16.1.0-1.el7.src.rpm \
    && yum -y update

# Install useful packages by yum
RUN yum -y install \
    git \
    make \
    vim \
    curl \
    wget \
    cabal-install

# Update Cabal and install shellcheck
# https://github.com/koalaman/shellcheck/issues/618
RUN cabal update \
    && cabal install process-1.1.0.2 Cabal \
    && cabal install shellcheck

# clean cached data
RUN yum clean all

CMD ["/usr/bin/bash"]
