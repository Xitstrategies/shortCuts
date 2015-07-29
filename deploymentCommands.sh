#!/bin/sh


DO NOT RUN THIS AS A SCRIPT!!!
#stuff
ssh morgan@dev.tradetech.net

ssh morgan@sys5a.tradetech.net
ssh morgan@sys5b.tradetech.net

#dev
#after updating syrinx field aliases
cd /spec/Syrinx.edge/ && stopDE && cd /spec/Syrinx.ApiEdge/ && stopDE && cd /spec/Syrinx.releaseCandidate/ && stopDE

#live
cd /spec/SyrinxDesktop/ && sudo git fetch -pt && sudo git checkout -b p1.13.3 v1.13.3

cd /spec/SyrinxFieldAliases/ && git checkout master && git pull origin master

cd /spec/Syrinx/ && sudo git checkout master && sudo git pull origin master && sudo git checkout -b v3.0.7 8a62ed307dc && stopDE

ssh morgan@dev.tradetech.net "cd /spec/Syrinx.releaseCandidate &&
git checkout master && git pull origin master && \n
git checkout -b v3.0.4 && stopDE && \n
cd /spec/SyrinxDesktop.stable/ && git fetch -pt && git checkout -b p1.13.1 v1.13.1"
scp ~/WebstormProjects/syrinx/desktop/www/production.html morgan@dev.tradetech.net:/spec/SyrinxDesktop.stable/www/production.html


aws cloudfront create-invalidation --distribution-id E8UBNPODBDJQH --invalidation-batch {"Paths": {"Quantity":13,"Items":["/langtrans/js/*.js"]},"CallerReference": "2015-07-01 13:53 PST"}
#E8UBNPODBDJQH

aws s3 cp s3://tradetech-dev/public/syrinxdesktop/media/js/tt-1435704859.js s3://tradetech-prod/public/syrinxdesktop/media/js/
aws s3 cp s3://tradetech-dev/public/syrinxdesktop/media/css/tt-1435704859.css s3://tradetech-prod/public/syrinxdesktop/media/css/
aws s3 cp s3://tradetech-dev/public/syrinxdesktop/production.html s3://tradetech-prod/public/syrinxdesktop/
aws s3 cp s3://tradetech-dev/public/syrinxdesktop/favicon.ico s3://tradetech-prod/public/syrinxdesktop/
aws s3 sync ~/WebstormProjects/syrinx/www/images_app/global/co_brand/ s3://tradetech-dev/public/syrinxdesktop/media/images/co_brand/
aws s3 sync ~/WebstormProjects/syrinx/www/images_app/global/co_brand/ s3://tradetech-prod/public/syrinxdesktop/media/images/co_brand/
