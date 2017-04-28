*magma-server
addToBeRefreshedWithoutOverwriting: anArray 
	"anArray of MaSerializedGraphBuffers was read from the repository files, but we want to keep the recent updates already in 'toBeRefreshed', which were from other user updates.
	Also, the toBeRefreshed is expected to be a Dictionary of MaObjectBuffers, make it so."
	anArray do: 
		[ : eachSerializedGraphBuffer | 
		eachSerializedGraphBuffer buffersDo: 
			[ : eachBuffer | 
			(toBeRefreshed includesKey: eachBuffer oid) ifFalse: 
				[ toBeRefreshed 
					at: eachBuffer oid
					put: eachBuffer independentCopy ] ] ]