operations
insert: anObject at: hashKey in: aNode 
	"Return an old value that compares: equal to anObject if one is present,
	 otherwise return nil to indicate a successful insertion."
	self
		locate: hashKey
		in: aNode ;
		 insert:
			(SOLHashNode
				key: hashKey
				value: anObject).
	^ anObject