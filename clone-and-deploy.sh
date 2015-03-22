#! /bin/bash
set -e
REPO=$1
CHECKOUT=$2

git clone https://github.com/$REPO /src/jekyll-site
cd /src/jekyll-site
git checkout $CHECKOUT

mkdir -p /site/logs
jekyll build -t --destination /site/content
chown -hR www-data:www-data /site

nginx
