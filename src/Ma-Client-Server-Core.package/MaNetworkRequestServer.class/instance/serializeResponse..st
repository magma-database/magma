private
serializeResponse: anObject 
	| timeToSerializeResponse response |
	timeToSerializeResponse := Time millisecondsToRun: 
		[ serializer resetOidManager.
		response := (serializer serializeGraph: anObject) trimmedByteArray ].
	console noteTimeToSerializeResponse: timeToSerializeResponse.
	^ response