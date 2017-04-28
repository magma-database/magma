access
at: key ifAbsent: aBlock
	| bucket |
	bucket := self bucketAt: (self keyHash: key).
	[bucket notNil] whileTrue: [ bucket key = key ifTrue: [^ bucket value]. bucket := bucket next ].
	^ aBlock value