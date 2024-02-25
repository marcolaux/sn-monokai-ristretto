#!/bin/sh
source .env
rm sn-monokai-ristretto.zip
zip -r sn-monokai-ristretto.zip ./ -x "package-lock.json" ".env" "*.sh" ".git*" ".git/*" "dist/.gitkeep" ".DS*" ".htaccess" "node_modules/*" "src/*" "*.txt"
ssh $server "cd $path; find ./ -type f -not -name '.htaccess' -delete; rm -fr dist"
scp sn-monokai-ristretto.zip $server:$path/sn-monokai-ristretto.zip
ssh $server "cd $path; unzip sn-monokai-ristretto.zip"
