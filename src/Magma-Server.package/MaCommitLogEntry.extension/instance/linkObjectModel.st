*magma-server
linkObjectModel
	| oidMap |
	oidMap := result permanentOids.
	commitPackage objectsDo:
		[ : eachBuffer | eachBuffer isPointers ifTrue:
			[ eachBuffer instVarsDoWithIndex:
				[ : oid : index | (MaOidCalculator isOidForNewObject: oid) ifTrue:
					[ "replace the temp oid with the permanent one."
					eachBuffer
						maInstVarAt: index
						put:
							(oidMap
								at: oid
								ifAbsent:
									[ MagmaInvalidReference
										referencingBuffer: eachBuffer
										oidOfMissingBuffer: oid
										signal: 'Invalid reference, an object may not change during serialization.' ]) ] ] ] ].
	commitPackage allLargeCollectionChangesDo:
		[ : each | each isNewCollection ifTrue:
			[ | permanentOid |
			permanentOid := oidMap
				at: each collectionOid
				ifAbsent: [ MagmaSoftwareError signal: 'expected to find permanent oid for new collection ' , each collectionOid printString ].
			each collectionOid: permanentOid ] ]