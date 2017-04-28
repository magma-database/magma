serializing
object: anObject toStream: aWriteStream 
	| objectGb |
	objectGb := self serializeGraph: anObject.
	self protocolEstablished 
ifFalse: 
		[ objectGb buffersMissingFromWhole ifNotEmptyDo: [: missing | MaSoftwareError signal: 'Incomplete graph, check serializer configuration.' ].
		"serialize protocol"
		aWriteStream nextPutAll: self classDefinitionsByteArray ].
	aWriteStream nextPutAll: objectGb byteArray.
	^ objectGb