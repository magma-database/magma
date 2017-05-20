private individual fixtures
noArgComplexBlock

	^[ | c |
		c := OrderedCollection new.
		MaObject withAllSubclasses do: [ :each | c add: each name asLowercase ].
		c ]
