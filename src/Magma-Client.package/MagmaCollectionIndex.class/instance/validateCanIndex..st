validate
validateCanIndex: anObject

	(self canIndex: anObject)
		ifFalse:
			[ MagmaUserError signal:
				'Cannot calculate the hashIndexFor: ' , anObject printString ]
