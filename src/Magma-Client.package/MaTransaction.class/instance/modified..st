writebarrier
modified: anObject 
	ignoreModifiedSignals ifFalse:
		[ | obj |
		obj := (anObject isArray and: [ dictionaryArrays includesKey: anObject ])
			ifTrue: [ dictionaryArrays at: anObject ]
			ifFalse: [ anObject ].
		commitPackage addObject: obj ]