#!/bin/bash

directories=("/ckad/chief-cardinal/" "/ckad/DF/" "/ckad/CKAD00016" "/ckad/credible-mite/" "/ckad/KDSP00101/data/" "/ckad/goshawk" "/ckad/daring-moccasin/" "/ckad/prompt-escargot/" "/ckad/CKAD202206/" "/ckad/ambassador/")

for dir in "${directories[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
  fi
done

cp www.yaml  /ckad/credible-mite/www.yaml
cp current-chipmunk-deployment.yaml /ckad/goshawk/current-chipmunk-deployment.yaml
cp broker-deployment.yaml /ckad/daring-moccasin/broker-deployment.yaml
cp honeybee-deployment.yaml /ckad/prompt-escargot/honeybee-deployment.yaml
cp ingress.yaml /ckad/CKAD202206/ingress.yaml
cp haproxy.cfg /ckad/ambassador/haproxy.cfg
cp index.html /ckad/KDSP00101/data/index.html
cp nosql.yaml /ckad/chief-cardinal/nosql.yaml
cp Dockerfile /ckad/DF/