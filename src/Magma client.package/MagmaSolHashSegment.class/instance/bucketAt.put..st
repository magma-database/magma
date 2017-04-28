private
bucketAt: bucketNum put: anObject 
	"Return whatever (SOLHashSegment, SOLHashNode, or nil) is in pointers at the index corresponding to bucketNum."
	(pointers isArray and: [ 1 + (bucketNum bitAnd: owner segMask) > pointers size ]) ifTrue: [ self convertToMagmaArray ].
	^ super
		bucketAt: bucketNum
		put: anObject