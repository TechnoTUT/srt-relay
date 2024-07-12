FROM oraclelinux:8

RUN dnf update -y \
    && dnf install -y tcl pkgconfig openssl-devel cmake gcc gcc-c++ make automake tar wget epel-release \
    && dnf clean all \
    && cd / \
    && wget https://github.com/Haivision/srt/archive/refs/tags/v1.5.3.tar.gz \
    && tar -xf v1.5.3.tar.gz \
    && cd srt-1.5.3 && mkdir _build && cd _build \
    && cmake .. \ 
    && make \
    && rm -rf /v1.5.3.tar.gz

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]