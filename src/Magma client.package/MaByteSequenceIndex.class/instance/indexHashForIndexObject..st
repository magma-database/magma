accessing
indexHashForIndexObject: aStringOrByteArray 
	"Answer the index hash value of the receiver, a value for a MaHashIndex."
	| answer power |
	aStringOrByteArray maOriginalClass isBytes ifFalse: 
		[ MagmaInvalidIndexObject signal: 'Not a valid index object.  Need a byte-object please.' ].
	answer := 0.
	power := meaningfulCharacters - 1.
	aStringOrByteArray do: 
		[ : eachChar | 
		(eachChar asInteger 
			between: 0
			and: self sizeOfCharacterSet - 1) ifTrue: 
			[ answer := answer + (eachChar asInteger * (self sizeOfCharacterSet raisedTo: power)).
			power := power - 1.
			power < 0 ifTrue: [ ^ answer ] ] ].
	^ answer