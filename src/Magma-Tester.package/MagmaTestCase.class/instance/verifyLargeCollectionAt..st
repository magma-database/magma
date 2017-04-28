client
verifyLargeCollectionAt: aString

	| localCollection largeCollection |

	clientSession abort.
	localCollection :=
		localRoot 
			at: aString
			ifAbsentPut: [ OrderedCollection new ].
	largeCollection := self clientSession root at: aString.
	self should: [ largeCollection size = localCollection size ].
	largeCollection do: [ :each | self should: [ localCollection includes: each ] ].
	localCollection do: [ :each | self should: [ (largeCollection includes: each) and: [ (largeCollection occurrencesOf: each) = 1 ] ] ]