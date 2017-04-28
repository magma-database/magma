*magma-server-private
addLogDaemonTo: aZipArchive as: appDbDirName
	aZipArchive
		addDeflateString: '#!/bin/bash
exec 2>&1
exec setuidgid magma multilog t ./main' squeakToLinux
		as: appDbDirName