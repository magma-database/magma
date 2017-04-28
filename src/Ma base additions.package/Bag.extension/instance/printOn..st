*ma base additions
printOn: aStream 
	aStream nextPutAll: 
		(self class name first isVowel 
			ifTrue: [ 'an ' ]
			ifFalse: [ 'a ' ]).
	self species printOn: aStream.
	contents keysAndValuesDo: 
		[ : eachKey : eachValue | 
		aStream
			cr ;
			tab ;
			maPrint: eachValue ;
			space ;
			nextPutAll: 'occurrencesOf: ' ;
			maPrint: eachKey ]