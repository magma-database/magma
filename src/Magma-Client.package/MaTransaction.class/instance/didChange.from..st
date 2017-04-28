testing
didChange: anObject from: aMaObjectBuffer 
	"Answer whether anObject has changed for this transaction."
	^ aMaObjectBuffer 
		isDifferent: anObject realObjectIfMutatingProxy
		using: session serializer