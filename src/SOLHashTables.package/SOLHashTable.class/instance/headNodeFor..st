private
headNodeFor: hashKey 
	| bucketNumber |
	^ (self bucketAt: (bucketNumber := hashKey bitAnd: keyMask)) ifNil: [ self initializeBucket: bucketNumber ]