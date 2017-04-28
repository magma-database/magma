building
linkMagmaArrays
	| oidMap |
	oidMap := result permanentOids.
	commitPackage allLargeCollectionChangesDo: 
		[ : eachChanges | 
		eachChanges isForMagmaArray ifTrue: 
			[ eachChanges additionsDo: 
				[ : eachIndex : eachOid | 
				(MaOidCalculator isOidForNewObject: eachOid) ifTrue: 
					[ "replace the temp oid with the permanent one."
					eachChanges 
						add: (oidMap 
								at: eachOid
								ifAbsent: 
									[ MagmaUserError signal: 'Invalid reference, an object may not change during serialization.' ])
						at: eachIndex ] ] ] ]