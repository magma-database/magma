private
advanceWith: aMaCommitLogEntry accumulatingConflictsIn: aMaFailedCommitResult 
	guard critical:
		[ | buffers conflict |
		buffers := OrderedCollection new.
		conflict := MagmaCommitConflict connection: aMaCommitLogEntry connection.
		aMaCommitLogEntry commitPackage objectsDo:
			[ : eachBuffer | buffers add: eachBuffer copyWithSameBuffer.
			self
				check: eachBuffer
				using: aMaCommitLogEntry connection
				accumulatingConflictsInto: aMaFailedCommitResult ].
		aMaFailedCommitResult populateConflictingObjectsFromOidsUsing: serializer.
		self
			
			refreshChangedObjects: buffers
			includingLocal: false ;
			 commitNumber: aMaCommitLogEntry result commitNumber ]