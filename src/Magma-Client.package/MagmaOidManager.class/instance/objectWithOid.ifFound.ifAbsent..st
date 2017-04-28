accessing
objectWithOid: anInteger ifFound: oneArgBlock ifAbsent: aBlock

	^MaOidCalculator
		objectWithOid: anInteger
		ifNone:
			[ (MaOidCalculator isOidForNewObject: anInteger)
				ifTrue:
					[ newObjects
						at: anInteger
						ifPresent:
							[ :obj |
							obj 
								ifNil: [ aBlock value ] 
								ifNotNil: [ oneArgBlock value: obj ] ]
						ifAbsent: aBlock ]
				ifFalse:
					[ objects
						at: anInteger
						ifPresent:
							[ :obj |
							obj   "oid key marked to be cleaned"
								ifNil: [ aBlock value ]
								ifNotNil: [ oneArgBlock value: obj ] ]
						ifAbsent: aBlock ] ]




