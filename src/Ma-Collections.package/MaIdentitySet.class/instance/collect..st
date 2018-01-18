as yet unclassified
collect: aBlock 
	"Evaluate aBlock with each of my values as the argument.  Collect the resulting values into a collection that is like me. Answer with the new collection."
	| newCollection |
	newCollection := self species new: self size.
	self associationsDo:
		[ : each | newCollection add: (aBlock value: each key) ].
	^ newCollection