linux-scripts
status
	"Report the pid, svstat, commitNumber and last access of this repository."
	^ '#!/bin/bash
APPNAME=`basename $PWD`
echo Status of $APPNAME
echo ---------------
ps -ef | grep $APPNAME
sudo svstat /service/$APPNAME
sudo setuidgid magma spur -vm display=none server-spur.image status.st' ->
		[ Smalltalk runAndQuit:
			[ : host : portString | (MagmaLocalLocation
				host: host
				port: portString asInteger) printStatusOn: FileStream stdout ] ]