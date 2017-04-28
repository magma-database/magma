validating
validateCanAdd: anObject

	(self canIndex: anObject) ifFalse: [
		MagmaUserError signal:
			anObject printString , ' cannot be added to ' , self printString ,
			' because it does not support all of the indexable attributes.' ]