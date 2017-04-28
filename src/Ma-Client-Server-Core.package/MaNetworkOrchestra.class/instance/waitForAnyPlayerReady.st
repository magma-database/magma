status
waitForAnyPlayerReady
	"Block until any player reports ready."
	[ guard critical:
		[ cores anySatisfy:
			[ : each | each notNil and:
				[ each isVariableBinding not and: [ each isReady ] ] ] ] ] whileFalse: [ (Delay forSeconds: 2) wait ]