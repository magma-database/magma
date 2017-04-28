accessing
associationAt: key ifAbsent: aBlock 
	
	^ (array at: (self keyHash:key)) maFindKey: key ifAbsent: aBlock
