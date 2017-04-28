private
indexHashForIndexObject: aString 
	"Answer the index hash value of the receiver, a value for a MaHashIndex."
	"First, load zeroString with conditioned characters from aString."
	"Now compute the hash value."
	| answer conditionedString |
	aString isString ifFalse: 
		[ MagmaInvalidIndexObject signal: 'Invalid index object, need a String.' ].
	conditionedString := self conditionedKeyword: aString.
	answer := 0.
	conditionedString doWithIndex: 
		[ : eachChar : index | 
		answer := answer + ((eachChar asciiValue - self lowChar) * (self sizeOfCharacterSet raisedTo: meaningfulCharacters - index)) ].
	^ answer