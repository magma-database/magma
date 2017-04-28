file
deleteUnnecessaryCommitLogFiles
	"Value oneArgBlock for each commit-log file in my commitsDirectory that is no longer needed for recovery of my repository."
	self unnecessaryCommitLogFileNamesDo: 
		[ : each | 
		self commitLogDirectory deleteFileNamed: each ]