building
appendProperlyPluralized: aString for: aNumber
	"aString should be a non-plural word.  This method will append the
	plural version of aString (by simply adding 's') if aNumber is > 1."

	self append: aString.
	aString last asLowercase = $s
		ifTrue: [ stream nextPut: $' ]
		ifFalse: [ stream nextPut: $s ]