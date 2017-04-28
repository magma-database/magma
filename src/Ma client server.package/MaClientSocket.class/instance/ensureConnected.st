private
ensureConnected
	"Ensure the primitive Socket is connected."
	socket 
		ifNil: [ self connect ]
		ifNotNil: 
			[ socket isConnected ifFalse: 
				[ self
					disconnect ;
					connect ] ]