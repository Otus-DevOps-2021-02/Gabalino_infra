#!/bin/bash

echo " -===== 1 ======- " && \
sudo apt-get update && \
echo " -===== 2 ======- " && \
sudo apt-get install -y git && \
echo " -===== 3 ======- " && \
cd ~ && \
echo " -===== 4 ======- " && \
git clone -b monolith https://github.com/express42/reddit.git && \
echo " -===== 5 ======- " && \
cd reddit && bundle install && \
echo " -===== 6 ======- " && \
puma -d
echo " -===== 0 ======- "
