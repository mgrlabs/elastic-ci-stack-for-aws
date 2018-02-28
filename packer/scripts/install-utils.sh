#!/bin/bash
set -eu -o pipefail

echo "Updating awscli..."
sudo yum update -y awscli

echo "Installing zip utils..."
sudo yum update -y -q
sudo yum install -y zip unzip

echo "Installing bats..."
sudo yum install -y git
sudo git clone https://github.com/sstephenson/bats.git /tmp/bats
sudo /tmp/bats/install.sh /usr/local

echo "Installing bk elastic stack bin files..."
sudo chmod +x /tmp/conf/bin/bk-*
sudo mv /tmp/conf/bin/bk-* /usr/local/bin

echo "Configuring awscli to use v4 signatures..."
sudo aws configure set s3.signature_version s3v4
