*ma-core
maPrintAbbreviatedOn: aStream 
	self size > 80
		ifTrue:
			[ aStream
				 nextPutAll:
					(self
						copyFrom: 1
						to: 77) ;
				 nextPutAll: '...' ]
		ifFalse: [ aStream nextPutAll: self ]