#!/bin/bash

echo " -===== 1 ======- " && \
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add - && \
echo " -===== 2 ======- " && \
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
echo " -===== 3 ======- " && \
sudo apt-get update && \
echo " -===== 4 ======- " && \
sudo apt-get install -y mongodb-org && \
echo " -===== 5 ======- " && \
sudo systemctl start mongod && \
echo " -===== 6 ======- " && \
sudo systemctl enable mongod && \
echo " -===== 7 ======- " && \
sudo systemctl status mongod && \
echo " -===== 0 ======- "
