FROM quay.io/centos/centos:stream8

ENV TINI_VERSION v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

EXPOSE 22

RUN yum -y install openssh openssh-server openssh-clients  hostname \
        iproute net-tools procps-ng && \
    yum -y clean all

ADD start.sh /start.sh

RUN chmod +x /start.sh /tini 

ENTRYPOINT ["/tini", "-g", "--"]

CMD /start.sh
