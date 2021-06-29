FROM registry.fedoraproject.org/fedora:33

RUN dnf upgrade -y --setopt=install_weak_deps=False \
        && dnf install -y --setopt=install_weak_deps=False git ansible python3-pip patch findutils jq vim \
        && dnf clean all

WORKDIR /

ENTRYPOINT [ "/usr/bin/bash" ]
