*ma-core
upgradespur: programName
	^ ('#!/bin/bash
NEW_VERSION="`basename ./products/{1}/lib/squeak/[0-9.-]*`"
echo Upgrading Spur to $NEW_VERSION
cp -a ./products/{1}/bin/squeak ./products/{1}/bin/spur
cp -a *.sources SqueakSSL ./products/{1}/lib/squeak/$NEW_VERSION
chmod -R 775 ./products/{1}/bin/spur ./products/{1}/lib/squeak
chmod ugo-x ./products/{1}/lib/squeak/$NEW_VERSION/*.sources
# install into Path locations
sudo cp -a ./products/{1}/* /usr/local
# Make high-level directories root writable, but public readable / executable
sudo chown -R root:root /usr/local/bin/squeak /usr/local/lib/squeak
# install thread-priorities for heartbeat thread
sudo cp -a squeak.conf /etc/security/limits.d/squeak.conf' format: {programName}) -> []