access
at: key put: value 
	| index bucket |
	index := self keyHash: key.
	"Don't use bucketAt: because we may need to call #atIndex:  insertKey:  value:, which will just look it up again."
	bucket := array 
		at: index
		ifAbsent: [ nil ].
	[ bucket notNil ] whileTrue:
		[ bucket key = key ifTrue:
			[ bucket value: value.
			"Restock this persistent bucket into the MagmaArray's changes so that subsquent access will find it there, and ensure it doesn't get GC'd before commit."
			array
				at: index
				put: bucket; refresh.
			^ value ].
		bucket := bucket next ].
	^ self
		atIndex: index
		insertKey: key
		value: value