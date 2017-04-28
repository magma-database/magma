as yet unclassified
at: key ifAbsent: aBlock
	| bucket |
	bucket := array at: (self keyHash: key).
	[bucket notNil] whileTrue: [ bucket key == key ifTrue: [^ bucket value]. bucket := bucket next ].
	^ aBlock value.
