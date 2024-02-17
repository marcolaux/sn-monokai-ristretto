#!/bin/sh
source .env
zip -r sn-monokai-ristretto.zip ./ -x ".env" "*.sh" ".git*" ".DS*"
rsync -arvz -e ssh --progress --delete --exclude={'.env','*.sh','.git*','.DS*'} ./ $server:$path
