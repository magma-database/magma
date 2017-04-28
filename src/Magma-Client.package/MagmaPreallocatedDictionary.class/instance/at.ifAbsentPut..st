access
at: key ifAbsentPut: aBlock 
	| index bucket |
	index := self keyHash: key.
	"Don't use bucketAt: because we may need to put the value of aBlock."
	bucket := array
		at: index
		ifAbsent: [ nil ].
	[ bucket notNil ] whileTrue:
		[ bucket key = key ifTrue:
			[ "array refresh."
			^ bucket value ].
		bucket := bucket next ].
	^ self
		atIndex: index
		insertKey: key
		value: aBlock value