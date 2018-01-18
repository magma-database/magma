printing
maPrintAbbreviatedOn: aStream

	1
		to: (self size min: 100)
		do:
			[ :each |
			aStream
				space;
				maPrint: (self at: each ifAbsent: [ 'error at: ', each printString ]) ].
	self size > 100 ifTrue: [ aStream nextPutAll: ' ...' ]