FROM prestodb/centos6-oj8:81233a7
MAINTAINER e558189

RUN \
  mkdir -p /usr/local/presto \
  && cd /usr/local/presto \
  && wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.208/presto-server-0.208.tar.gz \
  && tar xvfz presto-server-0.208.tar.gz \
  && rm -f presto-server-0.208.tar.gz \
  && wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.208/presto-cli-0.208-executable.jar \
  && ln -s presto-server-0.208 presto-server \
  && ln -s presto-cli-0.208-executable.jar presto-cli \
  && yum -y clean all && rm -rf /tmp/* /var/tmp/*

EXPOSE 8080

COPY ./files /usr/local/presto/presto-server