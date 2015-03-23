#!/bin/bash

cd /home/app/webapp

# give things a chance to start
sleep 5

if [ -z "$DATABASE_URL" ]; then
  
  if [ -z "$DATABASE_NAME" ]; then
    export DATABASE_NAME="spotlight";
  fi

  export DATABASE_URL="postgres://postgres:postgres@db:${DB_PORT_5432_TCP_PORT}/${DATABASE_NAME}?template=template0";
  echo "env DATABASE_URL=$DATABASE_URL;" > /etc/nginx/main.d/postgres-env.conf
  
  bundle exec rake db:create || true
fi
export RAILS_ENV=production

bundle exec rake db:migrate

chown app -R .