*magma client
cleanObject: anObject

	truncatedObjects
		removeKey: anObject
		ifAbsent: [ "no problem" ].
	^oidManager cleanObject: anObject