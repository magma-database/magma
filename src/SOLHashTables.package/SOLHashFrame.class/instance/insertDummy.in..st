operations
insertDummy: srchKey in: aNode
	| newNode |
	((nil ~= aNode) and: [self locate: srchKey in: aNode]) ifTrue: [^curr].
	newNode := SOLHashNode key: srchKey value: nil.
	(nil ~= aNode) ifTrue: [newNode := self insert: newNode].
	^newNode