#!/bin/bash

echo "Starting startup.sh.."
echo "*       *       *       *       *       run-parts /etc/periodic/1m" >> /etc/crontabs/root
crontab -l
