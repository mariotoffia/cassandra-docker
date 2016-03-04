FROM       cassandra:latest
MAINTAINER Mario Toffia <mario.toffia@dataductus.se>

VOLUME ["/var/lib/cassandra"]

RUN rm -f /docker-entrypoint.sh
RUN apt-get -y update
RUN apt-get -y install ruby && gem install tiller
RUN apt-get clean

ADD data/tiller/conf /etc/tiller
ADD data/tiller/ds /usr/local/lib/tiller/data/

# 7000: intra-node communication
# 7199: JMX
# 7001: TLS intra-node communication
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

# Run as cassandra user
USER cassandra

# Execute tiller template engine
CMD ["/usr/local/bin/tiller" , "-v"]
ENTRYPOINT ["/usr/local/bin/tiller"]

