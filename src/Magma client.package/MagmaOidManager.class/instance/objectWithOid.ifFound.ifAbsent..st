as yet unclassified
objectWithOid: anInteger ifFound: oneArgBlock ifAbsent: aBlock

	^MaOidCalculator
		objectWithOid: anInteger
		ifNone:
			[ (MaOidCalculator isOidForNewObject: anInteger)
				ifTrue:
					[ newObjects
						maAt: anInteger
						ifPresent:
							[ :obj |
							obj 
								ifNil: [ aBlock value ] 
								ifNotNil: [ oneArgBlock value: obj maPreferablyTheRealObject ] ]
						ifAbsent: aBlock ]
				ifFalse:
					[ objects
						maAt: anInteger
						ifPresent:
							[ :obj |
							obj   "oid key marked to be cleaned"
								ifNil: [ aBlock value ]
								ifNotNil: [ oneArgBlock value: obj maPreferablyTheRealObject ] ]
						ifAbsent: aBlock ] ]




