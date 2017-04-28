*magma-server-private
addReadMeTo: aZipArchive as: appDbDirName 
	aZipArchive
		addDeflateString: 'To access the unzipped scripts, execute permissions must be granted.  In a terminal:

	chmod u+x setPerms
	./setPerms

If this server has not been configured to run Magma, run configsys:

	./configsys

The system must be rebooted so that svscan will be started.  After rebooting, return to the ~/work/magma/myDb directory

If the model is the output of a backup, then it is a warm-backup of the original.  If you want it to run the copy independently of the original, you need to run detach:

	./detach

Finally, install this Magma DB as a daemontools service:

	./configdbservice

The DB will start immediately and stay running, and restart automatically after server reboots or even if the VM or system crashes.

To stop the database gracefully, use daemontools svc command:

	sudo svc -d /service/myDb
.' squeakToLinux
		as: appDbDirName