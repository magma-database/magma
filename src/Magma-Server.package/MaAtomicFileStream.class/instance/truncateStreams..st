private
truncateStreams: filePosition 
	| startingFileNumber fileStreamToTruncate |
	guard critical: 
		[ self 
			streamIndexAt: filePosition
			withRelativePositionDo: 
				[ : index : relativePosition | 
				startingFileNumber := relativePosition = 0
 					ifTrue: [ index ]
					ifFalse: [ index + 1 ].
				fileStreamToTruncate := fileStreams at: index.
				self renewAccess: fileStreamToTruncate.
				fileStreamToTruncate
					truncate: relativePosition ;
					close ;
					open
				"close and open to get around bug; see http://lists.squeakfoundation.org/pipermail/squeak-dev/2005-June/092041.html" ]
			ifNone: 
				[ "do nothing"
				 ].
		startingFileNumber ifNotNil: [self deleteFrom: startingFileNumber ] ]