private
bucketAt: anInteger 
	| answer |
	answer := array
		at: anInteger
		ifAbsent: [ nil ].
	array refresh.
	^ answer