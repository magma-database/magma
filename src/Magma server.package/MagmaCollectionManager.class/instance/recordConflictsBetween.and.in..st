private
recordConflictsBetween: aMagmaCollectionChanges and: challengingCommitLogEntry in: myCommitLogEntry 
	"Fail my result if any indexes have been added or removed since my last transaction boundary, because any adds or removes will have the wrong number of index values."
	(challengingCommitLogEntry hasCommitted: oidOfIndexesCollection) ifTrue: 
		[ myCommitLogEntry 
			failResultWith: challengingCommitLogEntry connection
			on: oidOfIndexesCollection ].
	"Fail my result if any objects being added or removed have been changed by any other session, because otherwise their index hash calculations may be incorrect."
	aMagmaCollectionChanges additionsDo: 
		[ : eachOid : eachHashIndexValues | 
		(challengingCommitLogEntry hasCommitted: eachOid) ifTrue: 
			[ myCommitLogEntry 
				failResultWith: challengingCommitLogEntry connection
				on: eachOid ] ].
	aMagmaCollectionChanges removedDo: 
		[ : eachOid : eachHashIndexValues | 
		(challengingCommitLogEntry hasCommitted: eachOid) ifTrue: 
			[ myCommitLogEntry 
				failResultWith: challengingCommitLogEntry connection
				on: eachOid ] ].
	"Fail my result if any objects being indexed have been changed by any other session, because otherwise their index hash calculations may be incorrect."
	aMagmaCollectionChanges newIndexValuesDo: 
		[ : eachOrderedCollection | 
		eachOrderedCollection do: 
			[ : eachAssocation | 
			(challengingCommitLogEntry hasCommitted: eachAssocation value) ifTrue: 
				[ myCommitLogEntry 
					failResultWith: challengingCommitLogEntry connection
					on: eachAssocation value ] ] ].
	"Fail my result if object keys being changed have been added or removed by any other session."
	challengingCommitLogEntry commitPackage allLargeCollectionChanges do: 
		[ : eachChallengingChanges | 
		eachChallengingChanges collectionOid = aMagmaCollectionChanges collectionOid ifTrue: 
			[ aMagmaCollectionChanges changedKeySpecificationsDo: 
				[ : eachChangedKeySpecification | 
				{ 
					(eachChallengingChanges added).
					(eachChallengingChanges removed)
				 } do: 
					[ : addedOrRemoved | 
					(addedOrRemoved includesKey: eachChangedKeySpecification oid) ifTrue: 
						[ myCommitLogEntry 
							failResultWith: challengingCommitLogEntry connection
							on: eachChangedKeySpecification oid ] ] ] ] ]