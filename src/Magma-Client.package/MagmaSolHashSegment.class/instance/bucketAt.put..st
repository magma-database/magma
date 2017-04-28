private
bucketAt: bucketNum put: anObject 
	"Return whatever (SOLHashSegment, SOLHashNode, or nil) is in pointers at the index corresponding to bucketNum."
	(pointers maIsLargeCollection not and: [ 1 + (bucketNum bitAnd: owner segMask) > self maxPointers ]) ifTrue: [ self convertToMagmaArray ].
	^ super
		bucketAt: bucketNum
		put: anObject