private
primSubmit: aMaClientServerRequest 
	^ submitGuard critical: 
		[ | answer responseByteArray beganSubmitting graphBuffer timeToSerialize |
		beganSubmitting := Time millisecondClockValue.
		socket stat: stat.
		timeToSerialize := Time millisecondsToRun: 
			[ serializer resetOidManager.
			graphBuffer := serializer serializeGraph: aMaClientServerRequest ].
		stat timeToSerializeHistory addValue: timeToSerialize.
		responseByteArray := socket 
			sendData: graphBuffer byteArray
			startingAt: 1
			count: graphBuffer bufferSize
			waitForReplyIn: ((aMaClientServerRequest wantsResponse and: [ self isUdp not ]) ifTrue: [ serializer byteArray ]).
		responseByteArray ifNotNil: 
			[ serializer resetOidManager.
			stat timeToMaterializeHistory addValue: (Time millisecondsToRun: [ answer := serializer materializeGraph: responseByteArray ]) ].
		(stat timeToSubmitHistoryFor: aMaClientServerRequest maOriginalClass) addValue: (Time millisecondsSince: beganSubmitting).
		answer ]