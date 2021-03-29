#!/bin/bash

echo " -===== 1 ======- " && \
sudo apt-get update && \
echo " -===== 2 ======- " && \
sudo apt-get install -y apt-transport-https ca-certificates && \
echo " -===== 3 ======- " && \
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - && \
echo " -===== 4 ======- " && \
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
echo " -===== 5 ======- " && \
sudo apt-get update && \
echo " -===== 6 ======- " && \
sudo apt-get install -y mongodb-org && \
echo " -===== 7 ======- " && \
sudo systemctl start mongod && \
echo " -===== 8 ======- " && \
sudo systemctl enable mongod && \
echo " -===== 9 ======- " && \
sudo systemctl status mongod && \
echo " -===== 0 ======- "
