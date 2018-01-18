*ma-core
upgradespur: programName
	^ ('#!/bin/bash
NEW_VERSION="`basename ./{1}/lib/squeak/[0-9.-]*`"
echo Upgrading Spur to $NEW_VERSION
cp -a ./{1}/bin/squeak ./cogspurlinux/bin/spur
cp -a *.sources SqueakSSL ./{1}/lib/squeak/$NEW_VERSION
chmod -R 775 ./{1}/bin/spur ./{1}/lib/squeak
chmod ugo-x ./{1}/lib/squeak/$NEW_VERSION/*.sources
# install into Path locations
sudo cp -a {1}/* /usr/local
# Make high-level directories root writable, but public readable / executable
sudo chown -R root:root /usr/local/binsqueak /usr/local/lib/squeak
# install thread-priorities for heartbeat thread
sudo cp -a squeak.conf /etc/security/limits.d/squeak.conf' format: programName) -> []