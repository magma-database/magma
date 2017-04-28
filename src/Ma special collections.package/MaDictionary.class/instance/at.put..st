accessing
at: key put: value
	| index bucket  |
	index := self keyHash: key.
	bucket := array at: index.
	[bucket notNil] whileTrue: [ bucket key = key ifTrue: [ bucket value: value. ^ value ]. bucket := bucket next ].
	^ self atIndex: index insertKey: key value: value.

