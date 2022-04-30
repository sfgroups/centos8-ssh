FROM quay.io/centos/centos:stream8

ENV TINI_VERSION v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

EXPOSE 22

RUN yum -y install openssh openssh-server openssh-clients  hostname \
        iproute net-tools procps-ng \
        java-17-openjdk-devel
    
#RUN yum -y clean all

ARG uid=1000
ARG gid=1000

RUN mkdir -p -m 755 /work && \
 	if ! grep -q ":${gid}:" /etc/group;then groupadd -r -g ${gid} webgroup;fi && \
 	if ! grep -q ":${uid}:" /etc/passwd;then useradd -u ${uid} -m -g ${gid} webuser;fi && \
	chown webuser:webgroup /work


COPY * /work/

ADD start.sh /start.sh

RUN chmod +x /start.sh /tini 

ENTRYPOINT ["/tini", "-g", "--"]

CMD /start.sh
