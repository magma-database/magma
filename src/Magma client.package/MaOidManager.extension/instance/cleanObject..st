*magma client
cleanObject: anObject

	^oids
		removeKey: anObject
		ifAbsent: [ nil ]