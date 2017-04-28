actions
postWriteAdjustmentFor: trimmedCommitLogEntry 
	"Adding the very first MagmaStat to a repository, that class will not have been known until AFTER the normal write, but that means we won't have performed the prewriteAdjustmentTo:from: on it!  So, we have to go back to write it one more time to capture that adjustment and write the object properly."
	^ self initializeMagmaStatClassIds ifNotEmpty:
		[ : classIdsOfBuffersNeedingRewritten | Array streamContents: [ : stream | trimmedCommitLogEntry commitPackage objectsDo:
			[ : eachBuffer | (classIdsOfBuffersNeedingRewritten includes: eachBuffer classId) ifTrue:
				[ filer
					write: (stream nextPut: eachBuffer copyWithSameBuffer)
					index: false] ] ] ]