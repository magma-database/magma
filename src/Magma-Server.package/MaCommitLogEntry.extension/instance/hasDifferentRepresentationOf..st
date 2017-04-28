*magma-server
hasDifferentRepresentationOf: aMaObjectBuffer 
	| myBuffer |
	myBuffer := committed
		at: aMaObjectBuffer oid
		ifAbsent: [ ^ false ].
	^ (myBuffer equivalentTo: aMaObjectBuffer) not