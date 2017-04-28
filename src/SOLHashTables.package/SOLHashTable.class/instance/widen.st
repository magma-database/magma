private
widen
	"Double the number of available buckets.
	 This does not initialize any of the new buckets, that happens lazily, as they are filled."

	| oldBuckets depth maxBuckets numBuckets |
	"Before we can actually double the number of buckets, we need to see if the doubled number will fit into our current segment tree."
	oldBuckets := buckets.
	depth := oldBuckets depth.
	maxBuckets := 1 bitShift: segBits*(depth+1).
	numBuckets := 2*(keyMask+1).
	(maxBuckets < numBuckets) ifTrue:
	    ["We need a deeper segment tree."
		self deepen].
	"The segment tree is big enough, double the available buckets by adding a bit to the keyMask."
	keyMask := numBuckets - 1.
	