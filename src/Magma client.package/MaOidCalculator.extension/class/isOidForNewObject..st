*magma client
isOidForNewObject: anInteger

	^anInteger
		between: self newOidMinimum
		and: self firstUserObjectOid - 1