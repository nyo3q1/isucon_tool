#!/usr/bin/bash
cd /var/log/isucon/

now=date "+%Y%m%d-%H:%M:%S"
mkdir $now

ls | grep -v "202108" | xargs -I{} cp {} $now
aws s3 cp --recursive $now s3://isucon11-qualify-logs

mv $now/* ../
rm -rf $now
