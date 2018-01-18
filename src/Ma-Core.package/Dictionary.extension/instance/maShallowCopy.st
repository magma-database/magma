*ma-core
maShallowCopy

	| copy |
	copy := self species new.  "new: seems buggy w/ Dictionaries.."
	self keysAndValuesDo: 
		[ :eachKey :eachValue | copy at: eachKey put: eachValue ].
	^copy