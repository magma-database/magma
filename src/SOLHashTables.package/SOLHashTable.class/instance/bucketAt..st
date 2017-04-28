private
bucketAt: bucketNum
	"Return the dummy SOLHashNode that is the head of bucket bucketNum.
	 Return nil if the containing segment is not yet present or the bucket has not been initialized."

	| seg depth |
	seg := buckets.
	[nil = seg] whileFalse:
	    [depth := seg depth.
		(0 = depth) ifTrue:
		    ["We're at the bottom level, this segment contains pointers to nodes.
			 Return the one we are interested in."
			^seg bucketAt: bucketNum].
		"Not at the bottom, this segment points at segments with depth one less."
		seg := seg bucketAt: (bucketNum bitShift: ((depth * segBits) negated))].
	"We ran out of segments before reaching the bottom."
	^nil