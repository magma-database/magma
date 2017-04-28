admin
modelBackupTo: serverPathString 
	"Backup the model, but not the code-packages in this image, to the specified fully-qualified serverPathString."
	"Calls #fullBackupToServerPath:."
	self ensureIsAdminSession.
	^ self submit: 
		(MagmaFullBackupRequest new
			serverPath: serverPathString ;
			yourself)