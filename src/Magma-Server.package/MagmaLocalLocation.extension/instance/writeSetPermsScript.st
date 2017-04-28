*magma-server-private
writeSetPermsScript
	FileStream
		fileNamed: 'setPerms'
		do:
			[ : stream | stream
				 lineEndConvention: #lf ;
				truncate: 0 ;
				 maPrint: '#!/bin/bash
APPNAME=`basename $PWD`
echo strip public access from the entire directory
chmod -R o-rwx ../$APPNAME

echo grant access to user magma if this is not the first db on this instance
sudo chgrp -R --quiet magma ../$APPNAME

echo grant rwx permission to the linux scripts' ;
				 lf ; maPrint: 'chmod 770'.
			MagmaServerConsole linuxScriptSelectors , {'log/run'} do:
				[ : each | stream
					 space ;
					 maPrint: each ] ]