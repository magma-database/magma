admin
codeBackup
	"Backup the code-packages current in use by this image.  This only copies versions, not dirty working-copies."
	MagmaNotification signal: 'Code backup.'.
	self 
		mcModelFavorDiskSpaceIfPossible ;
		ensureMostRecentMcVersionsSaved