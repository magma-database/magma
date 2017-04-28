*magma tools
isValidOid: anInteger for: aMaObjectFiler 
	^ anInteger
		between: MaOidCalculator firstUserObjectOid
		and: aMaObjectFiler getNextOid - 1