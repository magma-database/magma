accessing
yourself
	"Short-cut to the object, rather than going through doesNotUnderstand:."
	^ [ self realObjectIfMutatingProxy ] ensure:
		[ session ifNotNil: [ session statistics houseCleaningTimeHistory addValue: (Time millisecondsToRun: [ session bulkBecomeProxies ]) ] ]