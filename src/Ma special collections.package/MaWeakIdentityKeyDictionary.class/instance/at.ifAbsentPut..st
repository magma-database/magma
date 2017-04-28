as yet unclassified
at: key ifAbsentPut: aBlock
	| index bucket |
	key ifNil: [ ^ aBlock value ].	"nil keys is not allowed"
	index := self keyHash: key.
	bucket := array at: index.
	[bucket notNil] whileTrue: [ bucket key == key ifTrue: [^ bucket value]. bucket := bucket next ].
	^ self atIndex: index insertKey: key value: aBlock value.
