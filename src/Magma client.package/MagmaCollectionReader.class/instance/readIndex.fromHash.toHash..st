expressions
readIndex: aMagmaCollectionIndex fromHash: lowHashValue toHash: highHashValue 
	"Answers a MaLargeCollectionReader."
	| clause |
	clause := MaClause new
		reader: self ;
		attribute: aMagmaCollectionIndex attribute ;
		lowKey: lowHashValue ;
		highKey: highHashValue ;
		yourself.
	self expression ifNil: [ self expression: clause ].
	^ clause