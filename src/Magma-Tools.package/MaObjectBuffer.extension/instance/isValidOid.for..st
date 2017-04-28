*magma-tools
isValidOid: anInteger for: aMaObjectFiler 
	^ anInteger
		between: FirstUserObjectOid
		and: aMaObjectFiler getNextOid - 1