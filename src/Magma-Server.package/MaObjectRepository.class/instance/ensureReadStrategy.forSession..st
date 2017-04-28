building
ensureReadStrategy: aMaReadStrategy forSession: sessionId

	| strategy |
	^(strategy :=
		self
			renewCurrentReadStrategy: aMaReadStrategy
			for: sessionId)

				ifNil: [ self systemReadStrategy ] 
				ifNotNil: [ strategy ]