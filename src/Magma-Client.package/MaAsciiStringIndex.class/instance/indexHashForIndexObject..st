accessing
indexHashForIndexObject: aString 
	"Answer the index hash value of the receiver, a value
	for a MaHashIndex.  Only ASCII values 0 - 127 are meaningful,
	all others in aString are ignored."
	aString isString ifFalse: 
		[ MagmaInvalidIndexObject signal: 'Not a valid index object.  Need a String please.' ].
	^ super indexHashForIndexObject: aString