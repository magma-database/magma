private
copyMostRecentCommitLogFileTo: commitLogOfBackup
	commitLogOfBackup assureExistence.
	(self commitLogDirectory entries detectMax: [ : each | each modificationTime ]) ifNotNil: [ : entry | entry copyTo: commitLogOfBackup ]