private
advanceWith: aMaCommitLogEntry 
	^ guard critical: 
		[ | objects |
		objects := OrderedCollection new.
		aMaCommitLogEntry commitPackage objectsDo: [ : aMaCommitLogRecordBuffer | objects add: aMaCommitLogRecordBuffer copyWithSameBuffer ].
		self
			refreshChangedObjects: objects ;
			commitNumber: aMaCommitLogEntry result commitNumber ]