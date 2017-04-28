accessing
at: key ifAbsentPut: aBlock
	| index bucket |
	index := self keyHash: key.
	bucket := array at: index.
	[bucket notNil] whileTrue: [ bucket key = key ifTrue: [^ bucket value]. bucket := bucket next ].
	^ self atIndex: index insertKey: key value: aBlock value.
