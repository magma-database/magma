evaluating
qualifyingHashesOf: anObject 
	| answer |
	answer := OrderedCollection new.
	(self index indexHashesForIndexObject: (anObject perform: attribute)) do: 
		[ : each | 
		(each 
			between: lowKey
			and: highKey) ifTrue: [ answer add: attribute -> each ] ].
	^ answer