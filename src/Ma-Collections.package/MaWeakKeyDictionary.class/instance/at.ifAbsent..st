as yet unclassified
at: key ifAbsent: aBlock
	| bucket |
	"nil keys always absent in weak dictionary"
	key ifNil: [ ^ aBlock value ] ifNotNil: [
		bucket := array at: (self keyHash: key).
		[bucket notNil] whileTrue: [ bucket key = key ifTrue: [^ bucket value]. bucket := bucket next ].
		^ aBlock value.
	]
