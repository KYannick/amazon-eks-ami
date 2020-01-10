FROM hashicorp/packer:light

LABEL maintainer Yannick Kint <yannick.kint@kbc.be>

RUN apk add --update make && \
       mkdir -p /tmp/source/files /tmp/source/log-collector-script
ADD amazon-eks-nodegroup.yaml ArchiveBuildConfig.yaml Config eks-worker-al2.json install-worker.sh enable-selinux.sh Makefile /tmp/source/
COPY files/ /tmp/source/files/
ADD log-collector-script/* /tmp/source/log-collector-script/

WORKDIR /tmp/source

ENTRYPOINT ["/usr/bin/make", "AWS_DEFAULT_REGION=eu-west-1", "1.14"]
