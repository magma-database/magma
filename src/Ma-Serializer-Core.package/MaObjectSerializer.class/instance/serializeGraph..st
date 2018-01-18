serializing
serializeGraph: anObject
	"Serialize anObject and answer it as a MaSerializedGraphBuffer."
	^self
		serializeGraph: anObject
		do: [ :each | nil ]
