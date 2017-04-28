building
linkObjectModel
	| oidMap |
	oidMap := result permanentOids.
	commitPackage objectsDo: 
		[ : eachBuffer | 
		eachBuffer isPointers ifTrue: 
			[ eachBuffer instVarsDoWithIndex: 
				[ : oid : index | 
				(MaOidCalculator isOidForNewObject: oid) ifTrue: 
					[ "replace the temp oid with the permanent one."
					eachBuffer 
						maInstVarAt: index
						put: (oidMap 
								at: oid
								ifAbsent: 
									[ MagmaUserError signal: 'Invalid reference, an object may not change during serialization.' ]) ] ] ] ]