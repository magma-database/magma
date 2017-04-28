evaluating
qualifyingHashesOf: anObject 
	| answer |
	"Initial size of 1 to support scaling of Tephra cubes with many dimensions."
	answer := OrderedCollection new: 1.
	(self index indexHashesFor: anObject) do: 
		[ : each | 
		(each 
			between: lowKey
			and: highKey) ifTrue: [ answer add: attribute -> each ] ].
	^ answer