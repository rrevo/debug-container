FROM ubuntu:trusty

# Install curl
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Install etcd client

ENV ETCD_VER v3.0.13

RUN curl -L https://github.com/coreos/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz \
         -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

RUN mkdir /tmp/test-etcd && \
    tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/test-etcd --strip-components=1 && \
    mv /tmp/test-etcd/etcdctl /usr/local/bin && \
    rm -rf /tmp/test-etcd /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

CMD ["/bin/bash"]

