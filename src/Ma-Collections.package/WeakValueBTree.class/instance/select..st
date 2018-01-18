enumerating
select: aBlock
	| answer |
	answer := self species new.
	self keysAndValuesDo:
		[ : eachKey : eachValue |
		(aBlock value: eachValue) ifTrue: 
			[answer
				at: eachKey
				put: eachValue ] ].
	^ answer