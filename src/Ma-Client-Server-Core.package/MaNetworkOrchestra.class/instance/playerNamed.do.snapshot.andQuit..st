player setup
playerNamed: aString do: aBlock snapshot: shouldSave andQuit: shouldQuit 
	self
		playerNamed: aString
		do:
			[ aBlock value.
			Smalltalk
				snapshot: shouldSave
				andQuit: shouldQuit ]