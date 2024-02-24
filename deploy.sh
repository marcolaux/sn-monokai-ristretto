#!/bin/sh
source .env
rm sn-monokai-ristretto.zip
zip -r sn-monokai-ristretto.zip ./ -x "package-lock.json" ".env" "*.sh" ".git*" ".DS*" ".htaccess" "node_modules/*" "src/*" "*.txt"
rsync -arvz -e ssh --progress --delete --exclude={'.env','*.sh','.git*','.DS*','.htaccess','node_modules','src','.gitkeep','*.txt'} ./ $server:$path
