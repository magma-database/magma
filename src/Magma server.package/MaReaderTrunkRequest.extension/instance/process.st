*magma server
process
	^ self repository 
		getTrunkFor: collectionOid
		expression: expression