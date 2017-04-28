*ma object serialization tester
maEquivalentForSerializationTest: anObject using: alreadyComparedDictionary halt: shouldHalt 
	| answer identityCheck |
	self == anObject ifTrue: [^true].
	(anObject isKindOf: self maOriginalClass) ifFalse: [^false].
	identityCheck := false.	"purpose of this is for debugging, when halt is on you know where it went."
	^(1 to: self maInstSize) allSatisfy: 
			[:x | 
			| myX otherX |
			myX := self instVarAt: x.
			otherX := anObject instVarAt: x.
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