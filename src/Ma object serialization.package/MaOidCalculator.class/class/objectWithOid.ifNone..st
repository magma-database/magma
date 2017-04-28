atomics
objectWithOid: anInteger ifNone: aBlock

	anInteger == self oidForNil ifTrue: [ ^nil ].
	anInteger == self oidForFalse ifTrue: [ ^false ].
	anInteger == self oidForTrue ifTrue: [ ^true ].
	(self isOidForFloat: anInteger)
		ifTrue:
			[ ^self floatFromOid: anInteger ].
	(self isOidForOptimizedInteger: anInteger)
		ifTrue:
			[ ^self integerFromOid: anInteger ].
	(anInteger
		between: self firstCharacterOid
		and: self lastCharacterOid)
			ifTrue:
				[ ^Character value: anInteger - self firstCharacterOid ].
	^aBlock value