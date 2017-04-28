accessing
bucketAt: bucketNum 
	"Return whatever (SOLHashSegment, SOLHashNode, or nil) is in pointers at the index corresponding to bucketNum."
	^ pointers
		at: 1 + (bucketNum bitAnd: owner segMask)
		ifAbsent: [ nil ]