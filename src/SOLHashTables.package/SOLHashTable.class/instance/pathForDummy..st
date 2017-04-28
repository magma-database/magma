debugging
pathForDummy: dummyNode
	"Return a string containg a comma separated list of SOLHashSegment indexes leading to the bucket starting at dummyNode.
	 If you try this on a regular node you may hit uninitialized buckets or segments."

	| frwdKey seg depth path sx |
	frwdKey := self bitReverse: (dummyNode key).
	seg := buckets.
	(nil = seg) ifTrue:
	    [depth := 0.
		path := '']
	ifFalse:
	    [depth := seg depth.
		sx := (frwdKey bitShift: ((segBits * depth) negated)) bitAnd: segMask.
		path := sx printString].
	[0 < depth] whileTrue:
	    [depth := depth - 1.
		seg := seg bucketAt: sx.
		sx := (frwdKey bitShift: ((segBits * depth) negated)) bitAnd: segMask.
		path := path, ',', (sx printString)].
	^path