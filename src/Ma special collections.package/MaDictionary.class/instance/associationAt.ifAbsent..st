private
associationAt: key ifAbsent: aBlock 
	| bucket |
	bucket := array at: (self keyHash:key).
	^ bucket ifNil: aBlock
		ifNotNil: [ (bucket findKeyOrNil: key) ifNil: aBlock ]