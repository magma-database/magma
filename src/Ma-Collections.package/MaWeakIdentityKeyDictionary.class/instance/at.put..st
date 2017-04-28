as yet unclassified
at: key put: value
	| index bucket  |
	key ifNil: [ ^ value ].	"nil keys is not allowed"
	index := self keyHash: key.
	bucket := array at: index.
	[bucket notNil] whileTrue: [ bucket key == key ifTrue: [ bucket value: value. ^ value ]. bucket := bucket next ].
	^ self atIndex: index insertKey: key value: value.
