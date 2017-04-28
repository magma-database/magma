set -e

wget -O - http://get.pharo.org/60+vmTLatest | bash

rm -rf ./magma/src/*

./pharo Pharo.image ./magma/scripts/installExporter.st --save --quit
./pharo Pharo.image st ./magma/scripts/export.st --quit



