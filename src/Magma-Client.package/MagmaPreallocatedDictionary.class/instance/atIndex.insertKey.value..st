private
atIndex: index insertKey: key value: value
	| currentBucket newBucket |
	currentBucket := self bucketAt: index.
	currentBucket ifNotNil: [ collisions := collisions + 1 ].
	newBucket := self associationClass key: key value: value next: (currentBucket).
	array at: index put: newBucket.
	tally increment: 1.
	^ value