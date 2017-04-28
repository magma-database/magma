testing
isFirstEntryFor: sessionId

	^entries notEmpty and: [ entries first connection sessionId = sessionId ]
