*ma-core-linux-scripts
setPerms
	"Script to give execute permission to my scripts."
	^ (String streamContents:
		[ : stream | stream
			 maPrint: '#!/bin/bash
echo strip public access from the entire directory
chmod -R o-rwx ../`basename $PWD`
echo grant rwx permission to the linux scripts' ;
			 lf ;
			 maPrint: 'chmod ug+x'.
		self linuxScriptSelectors do:
			[ : each | stream
				 space ;
				 maPrint: each ] ]) -> [ ]