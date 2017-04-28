*ma object serialization tester
maEquivalentForSerializationTest: aReadStream using: alreadyComparedDictionary halt: aBoolean 
	self == aReadStream ifTrue: [^true].
	(aReadStream isKindOf: self maOriginalClass) ifFalse: [^false].
	self size = aReadStream size ifFalse: [^false].
	^self contents = aReadStream contents