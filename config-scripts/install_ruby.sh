#!/bin/bash
echo " -===== 1 ======- " && \
sudo apt update && \
echo " -===== 2 ======- " && \
sudo apt install -y ruby-full ruby-bundler build-essential && \
echo " -===== 3 ======- " && \
ruby -v && \
echo " -===== 4 ======- " && \
bundler -v && \
echo " -===== 0 ======- "
