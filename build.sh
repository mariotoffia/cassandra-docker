#!/bin/bash
cd ..
docker rmi mariotoffia/cassandra
docker build -t=mariotoffia/cassandra:latest cassandra-docker
#docker push mariotoffia/cassandra:latest
