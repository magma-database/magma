server side
conductorKnowsImReady
	">=2 one for the 'connect' request plus one for the 'ping' request.  See #isReady."
	^ self server console statistics timeToSendResponsesHistory summary count >= 2