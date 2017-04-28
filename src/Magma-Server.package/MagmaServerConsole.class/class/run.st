linux-scripts
run
	"deamontools run script.  put this in /mnt/work/magma/dbdir"
	^ '#!/bin/bash
exec 2>&1
# ensure _open file not present, otherwise DB will not open
# -- this bypasses Magma internal safety check.
# -- Should be fine, as long as starting and stopping
# -- is done ONLY through daemontools (e.g., svc -u and svc -d).
sudo setuidgid magma rm -f ./model/' , MagmaRepositoryController openIndicatorFilename ,
'
echo ensure model/commits dir owned by magma:magma
setuidgid magma mkdir -p model/commits
chgrp magma model/commits

# permission for root to run the HT version of the vm (thanks Levente Uzonyi)
ulimit -r 2
exec setuidgid magma spur -vm display=none server-spur.image run.st `cat port`' ->
		[ Smalltalk run:
			[ : portString |
			Smalltalk mitigateIfHeadless.
			(MagmaServerConsole new
				 open: 'model' ;
				 processOn: portString asInteger ;
				 yourself) explore ] ]