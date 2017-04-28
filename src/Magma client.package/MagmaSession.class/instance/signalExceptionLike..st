private
signalExceptionLike: anException 
	| signalableError |
	signalableError := anException maOriginalClass new 
		copyAttributes:
			(anException maOriginalClass allInstVarNames copyWithoutAll: #('signalContext' 'handlerContext' 'outerContext'))
		from: anException.
	"this is probably not necessary.."
	signalableError signal