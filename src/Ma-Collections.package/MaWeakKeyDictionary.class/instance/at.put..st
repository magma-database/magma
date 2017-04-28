as yet unclassified
at: key put: value
	| index bucket  |
	"its better to use some Dead unique object for determining dead weaklings,
	but since in squeak dead weaklings replaced by nil, we can't allow to add it as key"
	key ifNil: [ ^ value ].	"nil keys is not allowed"

	index := self keyHash: key.
	bucket := array at: index.
	[bucket notNil] whileTrue: [ bucket key = key ifTrue: [ bucket value: value. ^ value ]. bucket := bucket next ].
	^ self atIndex: index insertKey: key value: value.

