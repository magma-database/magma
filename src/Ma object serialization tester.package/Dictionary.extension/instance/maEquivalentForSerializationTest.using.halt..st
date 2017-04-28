*ma object serialization tester
maEquivalentForSerializationTest: anObject using: alreadyComparedDictionary halt: aBoolean
	self == anObject ifTrue: [ ^ true ].
	(anObject maOriginalClass = self maOriginalClass) ifFalse: [^false].
	self size = anObject size ifFalse: [^false].
	self keysDo:
		[ : eachMyKey |  | correspondingOtherKey |
		"first, find equivalent key in other Dictionary, unfortunately we can't use at:."
		correspondingOtherKey := anObject maAtSerializationEquivalent: eachMyKey.
		correspondingOtherKey ifNotNil:
			[ ((self at: eachMyKey)
				maEquivalentForSerializationTest: (anObject at: correspondingOtherKey)
				using: alreadyComparedDictionary
				halt: aBoolean)

				ifFalse: [ aBoolean ifTrue: [ self halt ] ifFalse: [ ^ false ] ] ] ].
	^ true