operations
find: srchKey in: aNode 
	(self
		locate: srchKey
		in: aNode) ifTrue: [ ^ curr value ].
	^ nil