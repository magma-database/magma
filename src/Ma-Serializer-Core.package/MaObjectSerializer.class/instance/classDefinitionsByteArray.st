accessing
classDefinitionsByteArray
	"Answer a ByteArray that can be used to reinitialize a new instance of the receiver so that it can materialize the objects it has serialized."

	^ (
self copyWithNewBuffer serializeGraph: self classIdManager classDefinitionsById) trimmedByteArray