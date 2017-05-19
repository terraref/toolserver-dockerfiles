FROM mdillon/postgis

ENV PG_USER=postgres
ENV POSTGRES_USER=postgres

RUN apt-get update -y && apt-get install curl vim -y 

COPY ./init-bety.sh /docker-entrypoint-initdb.d/zzbety.sh
