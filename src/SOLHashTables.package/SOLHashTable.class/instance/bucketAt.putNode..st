private
bucketAt: bucketNum putNode: node
	"Set the dummy SOLHashNode that is the head of bucket bucketNum and return the node.
	 Instantiate any missing segments needed to do so."

	| seg depth parentSeg parentNdx |
	seg := buckets.
	parentSeg := nil.
	parentNdx := 0.
	depth := 0.
	[true] whileTrue:
	    ["step down through the segments until we reach the bottom."
		(nil = seg) ifTrue:
		    ["Missing segment, fill it in."
			seg := self hashSegmentClass depth: depth owner: self.
			(nil = parentSeg) ifTrue:
			    [buckets := seg]
			ifFalse:
			    [seg := parentSeg bucketAt: parentNdx put: seg]].
		depth := seg depth.
		(0 = depth) ifTrue:
		    ["We're at the bottom level, this segment contains pointers to nodes.
			 Return the one we are interested in."
			^seg bucketAt: bucketNum put: node].
		"Not at the bottom, this segment points at segments with depth one less."
		parentSeg := seg.
		parentNdx := bucketNum bitShift: ((depth * segBits) negated).
		seg := parentSeg bucketAt: parentNdx.
		depth := depth - 1].
	"We ran out of segments before reaching the bottom."
	^nil