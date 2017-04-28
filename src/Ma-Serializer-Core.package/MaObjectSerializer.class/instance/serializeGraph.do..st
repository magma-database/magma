serializing
serializeGraph: anObject do: oneArgBlock
	"Serialize anObject and answer it as a MaSerializedGraphBuffer.  For each object traversed in the serialization, value oneArgBlock."
	^ self copyWithNewBuffer
		appendGraph: anObject
		do: oneArgBlock