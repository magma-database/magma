actions
applyToCache: trimmedCommitLogEntry 
	| newObjects buffersToRefresh |
	newObjects := trimmedCommitLogEntry result newObjectBuffers.
	trimmedCommitLogEntry commitPackage objectsDo:
		[ : eachBuffer | filer
			write: eachBuffer
			index: (newObjects includesKey: eachBuffer oid) ].
	"If writing regular objects caused any new LargeCollections we need to refresh my sessions view of the repository so I know about those collections because I'm about to update them, except of course unless trimmedCommitLogEntry is for the servers session."
	(trimmedCommitLogEntry isSystem not and: [ trimmedCommitLogEntry shouldServerRefresh ]) ifTrue:
		[ repositoryController refreshView.
		buffersToRefresh := self postWriteAdjustmentFor: trimmedCommitLogEntry ].
	self
		updateLargeCollectionsIn: trimmedCommitLogEntry commitPackage
		recordResultsIn: trimmedCommitLogEntry result.
	filer commitNumber: recoveryManager commitNumber.
	^ buffersToRefresh ifNil: [ Array empty ]