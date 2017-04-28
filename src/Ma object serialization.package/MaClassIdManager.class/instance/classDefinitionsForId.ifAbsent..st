accessing
classDefinitionsForId: anInteger ifAbsent: aBlock

	^ anInteger
		ifNil: [ aBlock value ]
		ifNotNil:
			[ classDefinitionsById
				at: anInteger
				ifAbsent: aBlock ]