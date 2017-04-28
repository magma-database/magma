*ma object serialization tester
maEquivalentForSerializationTest: anObject using: alreadyComparedDictionary halt: aBoolean 
	self == anObject ifTrue: [ ^ true ].
	"stop recursion"
	(anObject isKindOf: self maOriginalClass) ifFalse: [ ^ false ].
	self size = anObject size ifFalse: [ ^ false ].
	self do:
		[ : each | anObject
			detect:
				[ : eachInOther | each
					maEquivalentForSerializationTest: eachInOther
					using: MaIdentityDictionary new
					halt: false ]
			ifNone:
				[ aBoolean ifTrue: [ self halt ].
				^ false ] ].
	^ true