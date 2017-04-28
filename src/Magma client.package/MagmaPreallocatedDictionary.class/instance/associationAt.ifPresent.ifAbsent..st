private
associationAt: key ifPresent: presentBlock ifAbsent: absentBlock 
	"This method can help reduce the number of accesses to the receiver."
	| bucket |
	bucket := self bucketAt: (self keyHash: key).
	^ bucket
		ifNil: absentBlock
		ifNotNil:
			[ (bucket findKeyOrNil: key)
				ifNil: absentBlock
				ifNotNilDo:
					[ : assoc | presentBlock value: assoc ] ]