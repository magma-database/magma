actions
renewCurrentReadStrategy: aMaReadStrategy for: sessionId

	| session |
	session := self sessionWithId: sessionId.
	aMaReadStrategy ifNotNil: [ session currentReadStrategy: aMaReadStrategy ].
	^session currentReadStrategy