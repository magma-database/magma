linux-scripts
configdbservice
	"One time setup for a particular DB as a daemontools service.  If this is the first Magma service to run on this server, then configsys should be run first."
	^ '#!/bin/bash
echo ensure group magma access to model/commits directory
mkdir -p model/commits
sudo chgrp magma model/commits
sudo setuidgid magma chmod 770 model/commits

APPNAME="`basename $PWD`"

echo creating log/main directory
mkdir -p log/main
chmod o-rwx log/main
sudo chgrp magma log/main

echo installing daemon, it will start

sudo ln -s $PWD /etc/service/$APPNAME'
 ->
		[]