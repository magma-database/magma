player setup
playerNamed: aString do: aBlock andQuit: shouldQuit 
	self
		playerNamed: aString
		do: aBlock
		snapshot: false
		andQuit: true