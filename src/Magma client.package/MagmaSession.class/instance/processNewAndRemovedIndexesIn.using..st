private
processNewAndRemovedIndexesIn: aMagmaCommitPackage using: aMaCommitResult 
	| backupPackage |
	backupPackage := aMagmaCommitPackage copyWithNewLargeCollectionChanges.
	transaction resetCommitPackage.
	self 
		refreshViewUsing: aMaCommitResult
		includingLocal: false.
	backupPackage newIndexesDo: 
		[ : eachChanges | 
		| objectOidsAlreadyIndexed |
		objectOidsAlreadyIndexed := eachChanges added keys collect: 
			[ : each | 
			(MaOidCalculator isOidForNewObject: each) 
				ifTrue: 
					[ aMaCommitResult permanentOids 
						at: each
						ifAbsent: 
							[ MagmaSoftwareError signal: 'error building index, expected to find permanent oid' ] ]
				ifFalse: [ each ] ].
		eachChanges isNewCollection ifFalse: 
			[ eachChanges collection 
				buildIndexes: (eachChanges addedIndexes collect: [ : each | eachChanges collection indexNamed: each attribute ])
				ignoring: objectOidsAlreadyIndexed ] ].
	backupPackage removedIndexesDo: [ : eachCollection : eachIndexes | eachCollection commitUnlock ]