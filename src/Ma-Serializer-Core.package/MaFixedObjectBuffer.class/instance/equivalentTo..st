testing
equivalentTo: aMaFixedObjectBuffer 
	(super equivalentTo: aMaFixedObjectBuffer) ifFalse: [ ^ false ].
	self classVersion = aMaFixedObjectBuffer classVersion ifFalse: [ ^ false ].
	^ true