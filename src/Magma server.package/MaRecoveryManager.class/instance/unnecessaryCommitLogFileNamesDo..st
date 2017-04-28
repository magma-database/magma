file
unnecessaryCommitLogFileNamesDo: oneArgBlock 
	"Value oneArgBlock for each commit-log file in my commitsDirectory that is no longer needed for recovery of my repository."
	self commitLogDirectory in: 
		[ : dir | 
		dir entries do: 
			[ : each | 
			| nameParts |
			nameParts := dir splitNameVersionExtensionFor: each name.
			(nameParts at: 2) <= commitNumber ifTrue: 
				[ oneArgBlock value: (self commitLogDirectory fullNameFor: each name) ] ] ]