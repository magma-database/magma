magma-collections
loadMemberIndexOf: aMagmaCollectionManager using: aMaTerm from: oidInteger distinct: wantsDistinct 
	"Load memberIndex from the results expression aMaTerm."
	| executor sourceManager x mcChanges stillDoing nextWriteStop |
	sourceManager := self collectionManagerFor: oidInteger.
	[ sourceManager isLoading ] whileTrue: [ (Delay forMilliseconds: 500) wait ].
	executor := MaQueryExecutor 
		collectionManager: sourceManager
		expression: aMaTerm.
	aMagmaCollectionManager loadExecutor: executor.
	x := 1.
	nextWriteStop := 50.
	
	[ stillDoing := false.
	mcChanges := (MagmaCollectionChanges collection: aMagmaCollectionManager collection)
		collectionOid: aMagmaCollectionManager collectionOid ;
		yourself.
	executor 
		trunkFrom: x
		do: 
			[ : eachKey : eachOid | 
			| canPossiblyAdd |
			stillDoing := true.
			canPossiblyAdd := (wantsDistinct and: 
				[ (mcChanges added includesKey: eachOid) or: [ aMagmaCollectionManager memberIndex includesKey: eachOid ] ]) not.
			(canPossiblyAdd and: 
				[ aMaTerm 
					shouldInclude: eachOid
					using: sourceManager ]) ifTrue: 
				[ | hashesByIndex |
				hashesByIndex := self 
					hashKeysReferencing: eachOid
					inIndexesOf: sourceManager
					using: aMagmaCollectionManager.
				mcChanges added 
					at: eachOid
					put: hashesByIndex ].
			x := x + 1 ]
		until: [ aMagmaCollectionManager shouldStopLoading or: [ x = nextWriteStop ] ].
	stillDoing ] whileTrue: 
		[ | commitPackage |
		commitPackage := MaCommitPackage new
			objects: (MaSerializedGraphBuffer new: 4) ;
			yourself.
		commitPackage addLargeCollectionChanges: mcChanges.
		"Spare a potentially skewed read with requestCritical, not just commitCritical"
		repositoryController requestCritical: 
			[ self session begin.
			repositoryController forceWritePackage: commitPackage ].
		self flushCacheSoon.
		nextWriteStop := nextWriteStop + 50 ].
	"Fork the removeManager: to only do it *after* the flush of the transient MaHashIndex file.  That way, the manager will be able to be handled if a request come in before the flush writes out the file."
	[ (Delay forMilliseconds: (repositoryController cacheFlushFrequency*1000) + 1000) wait.
	self removeManager: aMagmaCollectionManager ] fork