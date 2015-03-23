#!/bin/bash

if [ -z "$COLLECTION_NAME" ]; then
  export COLLECTION_NAME="spotlight"
fi

if [ -z "$SOLR_URL" ]; then
  export SOLR_URL="http://solr:${SOLR_PORT_8983_TCP_PORT}/solr";
  echo "env SOLR_URL=\"$SOLR_URL/${COLLECTION_NAME}\";" > /etc/nginx/main.d/solr-env.conf
fi
