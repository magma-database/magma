atomics
objectWithOid: anInteger ifNone: aBlock 
	anInteger == OidForNil ifTrue: [ ^ nil ].
	anInteger == OidForFalse ifTrue: [ ^ false ].
	anInteger == OidForTrue ifTrue: [ ^ true ].
	(anInteger
		between: FirstFloatOid
		and: LastFloatOid) ifTrue: [ ^ self floatFromOid: anInteger ].
	(anInteger
		between: FirstSmallIntegerOid
		and: LastSmallIntegerOid) ifTrue: [ ^ self integerFromOid: anInteger ].
	(anInteger
		between: FirstCharacterOid
		and: LastCharacterOid) ifTrue: [ ^ Character value: anInteger - FirstCharacterOid ].
	^ aBlock value