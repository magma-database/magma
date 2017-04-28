private actions
removeKey: keyInteger at: anInteger

	self index
		remove: ((values at: keyInteger) removeAt: anInteger)
		at: keyInteger.
	sortedKeys remove: keyInteger.
	(values at: keyInteger) isEmpty ifTrue: [ values removeKey: keyInteger ].
	predictedSize := predictedSize - 1
