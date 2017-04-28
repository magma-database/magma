actions
applyToCache: aMaCommitLogEntry 
	| newObjects |
	newObjects := aMaCommitLogEntry result newObjectBuffers.
	aMaCommitLogEntry commitPackage objectsDo: 
		[ : eachBuffer | 
		filer 
			write: eachBuffer
			index: (newObjects includesKey: eachBuffer oid) ].
	"If writing regular objects caused any new LargeCollections we need to refresh my sessions view of the repository so I know about those collections because I'm about to update them, except of course unless aMaCommitLogEntry is for the servers session."
	(aMaCommitLogEntry isSystem not and: 
		[ aMaCommitLogEntry commitPackage shouldServerRefresh or: [ aMaCommitLogEntry shouldServerRefresh ] ]) ifTrue: [ repositoryController refreshView ].
	self 
		updateLargeCollectionsIn: aMaCommitLogEntry commitPackage
		recordResultsIn: aMaCommitLogEntry result.
	filer commitNumber: recoveryManager commitNumber