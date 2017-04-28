accessing
objectWithOid: anInteger ifFound: oneArgBlock ifAbsent: aBlock

	^oidManager
		objectWithOid: anInteger
		ifFound: oneArgBlock
		ifAbsent: aBlock
