private
associationAt: key ifAbsent: aBlock 
	| bucket |
	bucket := self bucketAt: (self keyHash: key).
	^ bucket
		ifNil: aBlock
		ifNotNil: [ (bucket findKeyOrNil: key) ifNil: aBlock ]