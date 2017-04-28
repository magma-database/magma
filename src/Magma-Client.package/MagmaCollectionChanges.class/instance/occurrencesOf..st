accessing
occurrencesOf: anObject

	| numberAdded numberRemoved |

	numberAdded := 0.
	self additionsDo:
		[ :eachObject :eachHashIndexValues |
		eachObject = anObject ifTrue: [ numberAdded := numberAdded + 1 ] ].
	numberRemoved := 0.
	self removedDo:
		[ :eachObject :eachHashIndexValues |
		eachObject = anObject ifTrue: [ numberRemoved := numberRemoved + 1 ] ].
	^numberAdded - numberRemoved
