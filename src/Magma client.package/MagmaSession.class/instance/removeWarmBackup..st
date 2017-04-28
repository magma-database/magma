high-availability
removeWarmBackup: aMagmaRemoteLocation 
	"Gracefully removes aMagmaRemoteLocation from the primary servers warm-backups, rather than shutting down abruptly and relying on error-handling."
	self ensureIsAdminSession.
	"Calls #removeSecondaryLocation:"
	self submit: (MaRemoveSecondaryLocationRequest new locationToRemove: aMagmaRemoteLocation)