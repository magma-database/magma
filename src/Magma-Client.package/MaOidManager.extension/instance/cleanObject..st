*magma-client
cleanObject: anObject 
	objects
		removeKey:
			(oids
				removeKey: anObject
				ifAbsent: [ ^ self ])
		ifAbsent: [  ]