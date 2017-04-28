backup / restore
fullBackupTo: aFileDirectory 
	"Backup the repository to aFileDirectory while the repository is open.  Files in the aFileDirectory will be overwritten."
	self isFullBackupRunning ifTrue: [ MagmaUserError signal: 'Model backup is already running.' ].
	aFileDirectory fullName = self directory fullName ifTrue: [ MagmaUserError signal: 'Must not back up to running server''s directory!' ].
	aFileDirectory exists ifTrue: [ MagmaEnvironmentError signal: aFileDirectory fullName , ' already exists??!' ].
	aFileDirectory assureExistence.
	self requestCritical:
		[ "start new commit log that begins with the very next transaction after this backup."
		self archiveCommitLog; copyMostRecentCommitLogFileTo: aFileDirectory / MaRecoveryManager commitLogDirectoryName.
		backupProcess := MaClientProcess doBlock:
			[ | filenames filesNotToCopy | [ repository flushCritical:
				[ "Flush now so we minimize the amount kept in RAM, and to ensure the backup is at the most current state."
				repository flushCache.
				filenames := self filenames.
				filesNotToCopy := 
					{MaRecoveryManager applyFilename. 
					self class openIndicatorFilename. 
					repository recoveryManager activeCommitLogFilename}.
				backupProcess
					 taskSize: filenames size - filesNotToCopy size ;
					 unitsVerbPhrase: 'files copied'.
				backupProcess advance.
				filenames do:
					[ : each | (filesNotToCopy includes: each) ifFalse:
						[ backupProcess shouldStop ifFalse:
							[ backupProcess description: 'Copying ' , each.
							[repository directory
								maCopyFileNamed: each
								toDirectory: aFileDirectory] on: FileExistsException do: [ : exc | backupProcess description: 'Backup FAILED!'.  MagmaSoftwareError signal: 'File should not possibly exist at this point.  Aborted.' ].
							backupProcess advance ] ] ].
				aFileDirectory fileNamed: 'about.txt' do: [ : stream | stream setToEnd; ascii; lf; maPrint: aFileDirectory localName; space; maPrint: DateAndTime now ] ].
			backupProcess shouldStop not ifTrue:
				[ (MaObjectFiler open: aFileDirectory)
					 restoreMode: true ;
					 close.
				backupProcess advance ] ] ensure:
				[ backupProcess stopped ifFalse: [ backupProcess description: 'Backup complete.' ] ] ].
		backupProcess
			 name: 'backing up to ' , aFileDirectory fullName ;
			 start ]