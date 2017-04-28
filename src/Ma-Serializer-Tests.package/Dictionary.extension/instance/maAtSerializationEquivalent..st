*ma-serializer-tests
maAtSerializationEquivalent: anObject

	self keysDo:
		[ : eachKey |
		(anObject
			maEquivalentForSerializationTest: eachKey
			using: MaIdentityDictionary new
			halt: false) ifTrue: [ ^ eachKey ] ].
	^ nil