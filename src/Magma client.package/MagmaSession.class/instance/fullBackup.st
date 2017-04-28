admin
fullBackup
	"Calls #fullBackup."
	self 
		ensureIsAdminSession; 
		mcModelFavorDiskSpaceIfPossible ;
		ensureMostRecentMcVersionsSaved.
	"Now, backup the entire object model."
	^ self submit: 
		(MagmaFullBackupRequest new
			serverPath: nil ;  "<-- causes server to backup to the defaultBackupDirectory"
			yourself)