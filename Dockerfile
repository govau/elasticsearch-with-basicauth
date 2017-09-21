FROM docker.elastic.co/elasticsearch/elasticsearch:5.1.2

# Remove X-Pack, do little dance to avoid AtomicMoveNotSupportedException
RUN \
  mv /usr/share/elasticsearch/plugins/x-pack /usr/share/elasticsearch/plugins/.removing-x-pack && \
  mv /usr/share/elasticsearch/plugins/.removing-x-pack /usr/share/elasticsearch/plugins/x-pack && \
  elasticsearch-plugin remove x-pack

# Install basic auth plugin
RUN elasticsearch-plugin install --batch https://github.com/elasticfence/elasticsearch-http-user-auth/releases/download/v5.1.2/elasticfence-5.1.2-SNAPSHOT.zip
