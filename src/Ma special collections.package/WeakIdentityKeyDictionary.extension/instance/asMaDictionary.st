*ma special collections
asMaDictionary
	| answer |
	answer := MaWeakIdentityKeyDictionary new.
	self keysAndValuesDo: 
		[ : key : value | 
		answer 
			at: key
			put: value ].
	^ answer