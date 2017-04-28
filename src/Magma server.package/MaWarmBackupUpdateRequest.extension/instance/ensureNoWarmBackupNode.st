*magma server
ensureNoWarmBackupNode
	^ (repositoryController node locations includes: requestingLocation) ifTrue: 
		[ repositoryController session commit: [ repositoryController node removeLocation: requestingLocation ] ]