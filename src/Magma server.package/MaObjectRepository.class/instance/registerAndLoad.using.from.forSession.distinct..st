magma-collections
registerAndLoad: aMaCommitPackage using: aMaTerm from: oidInteger forSession: sessionId distinct: aBoolean 
	| newManager result |
	result := self 
		registerResultSet: aMaCommitPackage
		forSession: sessionId.
	newManager := self collectionManagerFor: aMaCommitPackage allLargeCollectionChanges anyOne collectionOid.
	newManager loadProcess: (
		[ self 
			loadMemberIndexOf: newManager
			using: aMaTerm
			from: oidInteger
			distinct: aBoolean ] forkAt: Processor userBackgroundPriority).
	newManager loadProcess name: 'loading ' , newManager collectionOid printString.
	^ result