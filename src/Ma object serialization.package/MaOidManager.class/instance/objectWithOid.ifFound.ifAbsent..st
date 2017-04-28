accessing
objectWithOid: anInteger ifFound: oneArgBlock ifAbsent: aBlock

	^MaOidCalculator
		objectWithOid: anInteger
		ifNone:
			[ objects
				at: anInteger
				ifPresent:
					[ :obj |
					obj   "oid key marked to be cleaned"
						ifNil: [ aBlock value ]
						ifNotNil: [ oneArgBlock value: obj ] ]
				ifAbsent: [ aBlock value ] ]