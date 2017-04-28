admin
fullBackupTo: serverPathString 
	"Calls #fullBackupToServerPath:."
	self ensureIsAdminSession.
	^ self submit: 
		(MagmaFullBackupRequest new
			serverPath: serverPathString ;
			yourself)