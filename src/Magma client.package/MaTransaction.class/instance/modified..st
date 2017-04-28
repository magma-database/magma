writebarrier
modified: anObject 
	ignoreModifiedSignals ifFalse: 
		[ (session serializer isTruncated: anObject) ifTrue: [ self warnOfTruncationsIn: {  anObject  } ].
		commitPackage addObject: anObject ]