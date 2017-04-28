private
processAddsIn: aMaCollectionChanges using: aMaCommitResult 
	aMaCollectionChanges additionsDo: 
		[ : eachOid : eachHashIndexArrays | 
		| addedObjectOid |
		addedObjectOid := (MaOidCalculator isOidForNewObject: eachOid) 
			ifTrue: [ aMaCommitResult permanentOids at: eachOid ]
			ifFalse: [ eachOid ].
		self 
			addMember: addedObjectOid
			atHashes: eachHashIndexArrays ]