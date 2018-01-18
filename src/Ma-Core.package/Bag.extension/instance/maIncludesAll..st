*ma-core
maIncludesAll: aCollection
	"Return true if the receiver includes all elements in aCollection.
	If aCollection contains duplicate elements, the receiver must have
	one for each of them."

	| otherColl |

	aCollection size > self size ifTrue: [ ^false ].
	otherColl :=
		aCollection size > 20
			ifTrue: [ aCollection asBag ]
			ifFalse: [ aCollection ].
	otherColl do:
		[ :each | (self occurrencesOf: each) < (otherColl occurrencesOf: each) ifTrue: [ ^false ] ].
	^true