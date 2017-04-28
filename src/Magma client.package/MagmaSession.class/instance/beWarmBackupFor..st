high-availability
beWarmBackupFor: aMagmaRemoteLocation 
	"Instruct the server to be a warm-backup for the server running at aMagmaRemoteLocation."
	self ensureIsAdminSession.
	"Calls #beWarmBackupFor:."
	self submit: 
		(MagmaBeWarmBackupRequest new
			primaryLocation: aMagmaRemoteLocation ;
			yourself)