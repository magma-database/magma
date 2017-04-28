private
protocolByteArray
	^ protocolByteArray ifNil: 
		[ serializer resetOidManager.
		protocolByteArray := serializer classDefinitionsByteArray ]