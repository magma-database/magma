player setup
playerNamed: aString doAndQuit: aBlock
	self
		playerNamed: aString
		do: aBlock
		andQuit: true