#!/bin/sh


DO NOT RUN THIS AS A SCRIPT!!!

#dev
#after updating syrinx field aliases
cd /spec/Syrinx.edge/ && stopDE && cd /spec/Syrinx.ApiEdge/ && stopDE && cd /spec/Syrinx.releaseCandidate/ && stopDE

cd /spec/SyrinxDesktop.stable/ && git fetch -pt && git co -b p1.14.17 v1.14.17 && cd www && aws s3 cp s3://tradetech-prod/public/syrinxdesktop/production.html ./s3.html && cp s3.html production.html && rm s3.html && cd /spec/Syrinx.releaseCandidate && stopDE

#live
cd /spec/SyrinxDesktop/ && sudo git fetch -pt && sudo git checkout -b p1.15.1 v1.15.1 && cd /spec/Syrinx/ && stopDE


cd /spec/Syrinx/etc && vim config
cd /spec/Syrinx/ && sudo git checkout master && sudo git pull origin master && sudo git checkout -b v3.1.1 && stopDE

ssh @.tradetech.net "cd /spec/Syrinx.releaseCandidate &&
git checkout master && git pull origin master && \n
git checkout -b v3.0.4 && stopDE && \n
cd /spec/SyrinxDesktop.stable/ && git fetch -pt && git checkout -b p1.13.1 v1.13.1"

scp  ~/WebstormProjects/syrinx/desktop/www/s3_production.html @.tradetech.net:/spec/SyrinxDesktop/www/s3.html


aws cloudfront create-invalidation --distribution-id E8UBNPODBDJQH --invalidation-batch file://awsInvalidLangTrans.json
aws cloudfront create-invalidation --cli-input-json file://awsInvalidImagesLangTrans.json

cd /spec/Syrinx/ && sudo git checkout master && sudo git pull origin master && sudo git checkout -b v3.1.1 && cd /spec/SyrinxDesktop/ && sudo git fetch -pt && sudo git checkout -b p1.14.15 v1.14.15 && cd /spec/Syrinx/ && stopDE
