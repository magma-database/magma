*magma-client
read: attributeSymbol at: key
	"Allows Smalltalk collection to be used interchangeably with MagmaCollections"

	^ self select: [ :each | (each perform: attributeSymbol) = key ]
