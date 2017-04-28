*ma object serialization tester
maEquivalentForSerializationTest: aWriteStream using: alreadyComparedDictionary halt: aBoolean 
	self == aWriteStream ifTrue: [^true].
	(aWriteStream isKindOf: self maOriginalClass) ifFalse: [^false].
	self size = aWriteStream size ifFalse: [^false].
	^self contents = aWriteStream contents