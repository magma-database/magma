*ma-serializer-tests
maEquivalentForSerializationTest: anObject using: alreadyComparedDictionary halt: shouldHalt 
	| answer identityCheck |
	self == anObject ifTrue: [^true].
	(anObject isKindOf: self maOriginalClass) ifFalse: [^false].
	"Hm, this seems harmless enough."
	self = anObject ifTrue: [ ^ true ].
	identityCheck := false.	"purpose of this is for debugging, when halt is on you know where it went."
	^(1 to: self maInstSize) allSatisfy: 
			[:x | 
			| myX otherX |
			myX := self slotAt: x.
			otherX := anObject slotAt: x.
			answer := (alreadyComparedDictionary includesKey: myX) 
						ifTrue: 
							[identityCheck := true.
							(alreadyComparedDictionary at: myX) = otherX]
						ifFalse: 
							[myX ifNotNil: [alreadyComparedDictionary at: myX put: otherX].
							myX 
								maEquivalentForSerializationTest: otherX
								using: alreadyComparedDictionary
								halt: shouldHalt].
			(shouldHalt and: [answer == false]) ifTrue: [self halt] ifFalse: [answer]]