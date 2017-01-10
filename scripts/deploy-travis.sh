#!/usr/bin/env bash

# Deploy RPi1
git remote add rpi1 jhermsmeier@git.resin.io:jhermsmeier/rpi1.git
git push rpi1
# Deploy RPi2
git remote add rpi2 jhermsmeier@git.resin.io:jhermsmeier/rpi2.git
git push rpi2
# Deploy RPi3
git remote add rpi3 jhermsmeier@git.resin.io:jhermsmeier/rpi3.git
git push rpi3
