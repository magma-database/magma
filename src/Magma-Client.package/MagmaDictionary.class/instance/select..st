enumerating (slow)
select: aBlock 
	"Evaluate aBlock with each of my values as the argument. Collect into a new dictionary, only those associations for which aBlock evaluates to true."
	| newCollection |
	newCollection := self class new.
	self associationsDo:
		[ : each | (aBlock value: each value) ifTrue:
			[ newCollection
				at: each key
				put: each value ] ].
	^ newCollection