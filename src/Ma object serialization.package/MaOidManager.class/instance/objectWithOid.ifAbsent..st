accessing
objectWithOid: anInteger ifAbsent: aBlock

	^self
		objectWithOid: anInteger
		ifFound: [ :foundObj | foundObj ]
		ifAbsent: aBlock