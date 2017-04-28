accessing
occurrencesOf: anObject

	| newOccurrences |

	newOccurrences := changes occurrencesOf: anObject.
	(session isNil or:
		[ (session isPersistent: anObject) not or: [ (session isPersistent: self) not ] ])
			ifTrue:
				[ ^newOccurrences ].
	^(session
		occurrencesOf: anObject
		in: self) + newOccurrences
