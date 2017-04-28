private
keyHash: key
	^ (key hash \\ maxBuckets) + 1