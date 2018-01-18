private
checkForOverflow
	| sz |
	sz := array size.
	( sz < self maxBuckets) ifTrue: [
		tally >= (sz * 4) ifTrue: [ self rehash: (self bestArraySizeFor: tally * 2). ]
	]
	