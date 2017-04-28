backup / restore
fullBackup
	"Backup the repository to the defaultBackupDirectory while the repository is open.  If there is a Magma repository at pathString, an environment error is signaled."
	| dir |
	dir := self defaultBackupDirectory.
	[ self fullBackupTo: dir ] 
		on: MagmaDeleteWarning
		do: 
			[ : warn | 
			MagmaEnvironmentError signal: 'Did not expect backup-dir to already exist.  No action taken.' ].
	^ 'A new backup is being created at ' , dir fullName