private
materializeRequest: requestByteArray 
	| timeToMaterialize requestObject |
	timeToMaterialize := Time millisecondsToRun: 
		[ serializer resetOidManager.
		requestObject := serializer materializeGraph: requestByteArray ].
	console noteTimeToMaterializeRequest: timeToMaterialize.
	^ requestObject