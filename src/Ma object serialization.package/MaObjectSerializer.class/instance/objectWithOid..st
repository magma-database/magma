accessing
objectWithOid: anInteger
	^ oidManager
		objectWithOid: anInteger
		ifAbsent: [ self proxyFor: anInteger ]