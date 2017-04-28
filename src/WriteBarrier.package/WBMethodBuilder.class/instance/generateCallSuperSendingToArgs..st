private
generateCallSuperSendingToArgs: selectorSymbol 
	"After remembering instVars in temps, call the original version of the method in the superclass."
	stream
		 cr ;
		 tab ;
		 nextPutAll: 'returnValue := super '.
	selector partsAndArgsDo:
		[ : eachPart : eachArg | stream nextPutAll: eachPart.
		eachArg ifNotNil:
			[ stream
				 space ;
				 nextPutAll: eachArg.
			selectorSymbol ifNotNil:
				[ stream
					 space ;
					 nextPutAll: selectorSymbol ].
			stream space ] ].
	stream nextPut: $.