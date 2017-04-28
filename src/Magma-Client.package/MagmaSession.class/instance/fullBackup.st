admin
fullBackup
	"Calls #fullBackup."
	self ensureIsAdminSession.
	"Code backup is just regular commits to the repository, must use a normal session, not an admin session in case this is an HA node."
	self location newSession
		 connectAs: 'fullBackup' ;
		 codeBackup ;
		 uiBackup.
	self modelBackup