private
deepen
	"Deepen the segment tree by one layer, putting the old tree in bucket 0 of the new segment."
	| oldBuckets newBuckets |
	oldBuckets := buckets.
	newBuckets := self hashSegmentClass 
		depth: oldBuckets depth + 1
		owner: self.
	newBuckets
		bucketAt: 0
		put: oldBuckets.
	buckets := newBuckets