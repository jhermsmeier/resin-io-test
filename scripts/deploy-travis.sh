#!/usr/bin/env sh

# Decrypt deployment key
openssl aes-256-cbc -K $encrypted_d95c70ccd684_key -iv $encrypted_d95c70ccd684_iv -in .travis/deploy_resin_ed25519.enc -out .travis/deploy_resin_ed25519 -d
# Start ssh-agent
eval "$(ssh-agent -s)"
# Add deploy key
chmod 600 .travis/deploy_resin_ed25519
ssh-add .travis/deploy_resin_ed25519

# Deploy RPi1
git remote add rpi1 jhermsmeier@git.resin.io:jhermsmeier/rpi1.git
git push rpi1
# Deploy RPi2
git remote add rpi2 jhermsmeier@git.resin.io:jhermsmeier/rpi2.git
git push rpi2
# Deploy RPi3
git remote add rpi3 jhermsmeier@git.resin.io:jhermsmeier/rpi3.git
git push rpi3
