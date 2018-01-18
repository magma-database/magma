accessing
copy
	| answer |
	answer := self class new.
	self keysAndValuesDo: 
		[ : eachKey : eachValue | 
		answer 
			at: eachKey 
			put: eachValue ].
	^ answer