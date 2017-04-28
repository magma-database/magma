access
bufferAt: anInteger 
	^ bufferFacades 
		at: anInteger
		ifAbsentPut: [ self newFacadeFor: anInteger ]