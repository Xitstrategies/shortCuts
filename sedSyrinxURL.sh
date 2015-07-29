#!/bin/sh

sed -Ei "s/https:\/\/cdn.tradetech.net\/syrinxdesktop\/media\//https:\/\/s3-us-west-2.amazonaws.com\/tradetech-dev\/public\/syrinxdesktop\/media\//g" ~/WebstormProjects/syrinx/desktop/www/production.html
