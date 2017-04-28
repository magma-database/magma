status
waitForAllPlayersReady
	"Block until all players report ready."
	| numberReady maxThatCanBeReady |
	maxThatCanBeReady := guard critical: [ cores size min: players size ].
	[ (Delay forSeconds: 5) wait.
	numberReady := guard critical:
		[ cores count:
			[ : each | each notNil and:
				[ each isVariableBinding not and: [ each value isReady ] ] ] ].
	numberReady >= maxThatCanBeReady ] whileFalse