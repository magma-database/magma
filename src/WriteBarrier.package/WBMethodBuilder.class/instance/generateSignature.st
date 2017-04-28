private
generateSignature
	"Write the first-line of the method."
	selector partsAndArgsDo:
		[ : eachPart : eachArg | stream nextPutAll: eachPart.
		eachArg ifNotNil:
			[ stream
				 space ;
				 nextPutAll: eachArg ;
				 space ] ]