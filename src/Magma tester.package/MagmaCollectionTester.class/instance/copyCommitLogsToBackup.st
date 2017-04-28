test backup/restore
copyCommitLogsToBackup
	| sourceDir targetDir |
	magmaConsole controller archiveCommitLog.
	sourceDir := magmaConsole controller commitLogDirectory.
	targetDir := (FileDirectory on: (self backupDirectory fullNameFor: MaRecoveryManager commitLogDirectoryName)) assureExistence.
	sourceDir fileNames do: 
		[ : each | 
		sourceDir 
			maCopyFileNamed: each
			toDirectory: targetDir ].
	^ magmaConsole controller commitNumber