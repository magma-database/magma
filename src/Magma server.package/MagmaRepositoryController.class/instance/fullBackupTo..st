backup / restore
fullBackupTo: aFileDirectory 
	"Backup the repository to aFileDirectory while the repository is open.  Files in the aFileDirectory will be overwritten."
	self isFullBackupRunning ifTrue: [ MagmaUserError signal: 'Full backup is already running.' ].
	aFileDirectory fullName = self directory fullName ifTrue: 
		[ MagmaUserError signal: 'Must not back up to running server''s directory!' ].
	aFileDirectory isRemoteDirectory 
		ifTrue: 
			[ (aFileDirectory fileExists: MaObjectFiler objectsPhysicalFilename) ifTrue: 
				[ MagmaDeleteWarning signal: 'The repository at ' , aFileDirectory printString , ' will be deleted'.
				aFileDirectory deleteLocalFiles ] ]
		ifFalse: [ (MagmaLocalLocation path: aFileDirectory fullName) delete ].
	(aFileDirectory exists and: [ aFileDirectory entries notEmpty ]) ifTrue: 
		[ MagmaEnvironmentError signal: 'Could not delete old backup.  In use?' ].
	aFileDirectory assureExistence.
	self requestCritical: 
		[ "start new commit log that begins with the very next transaction after this backup."
		| backupBlock |
		self archiveCommitLog.
		backupProcess := MaClientProcess doBlock: 
			[ | tempDir filenames |
			
			[ tempDir := FileDirectory on: (repository directory fullNameFor: 'temp').
			tempDir exists ifTrue: [ tempDir recursiveDelete ].
			tempDir assureExistence.
			repository flushCritical: 
				[ "Flush now so we minimize the amount kept in RAM, and to ensure the backup is at the most current state."
				repository flushCache.
				filenames := self filenames.
				backupProcess progressor
					taskSize: filenames size + 2 ;
					unitsVerbPhrase: 'files copied' ;
					description: 'copying ' , MaObjectFiler objectsPhysicalFilename , ' to temp'.
				backupProcess shouldStop ifFalse: 
					[ repository directory 
						maCopyFileNamed: MaObjectFiler objectsPhysicalFilename
						toDirectory: tempDir ].
				"Let's not wait for resume because the server is eating memory while waiting!"
				"				backupProcess waitForResume."
				backupProcess progressor advance.
				filenames do: 
					[ : each | 
					({ 
						(MaRecoveryManager applyFilename).
						(MaObjectFiler objectsPhysicalFilename).
						self class openIndicatorFilename.
						(repository recoveryManager activeCommitLogFilename)
					 } includes: each) ifFalse: 
						[ backupProcess shouldStop ifFalse: 
							[ backupProcess progressor description: 'Copying ' , each.
							repository directory 
								maCopyFileNamed: each
								toDirectory: aFileDirectory.
							"							backupProcess waitForResume."
							backupProcess progressor advance ] ] ] ].
			(tempDir notNil and: [ backupProcess shouldStop not ]) ifTrue: 
				[ (MaObjectFiler open: tempDir)
					restoreMode: true ;
					close.
				tempDir 
					maCopyFileNamed: MaObjectFiler objectsPhysicalFilename
					toDirectory: aFileDirectory.
				backupProcess progressor advance ] ] ensure: 
				[ backupProcess stopped 
					ifTrue: [ backupProcess signalWaiterOnStop ]
					ifFalse: [ backupProcess progressor description: 'Backup complete.' ].
				tempDir ifNotNil: [ tempDir exists ifTrue: [ tempDir recursiveDelete ] ] ] ].
		backupProcess
			name: 'backing up to ' , aFileDirectory fullName ;
			start ]