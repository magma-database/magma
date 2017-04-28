player setup
playerNamed: aString do: aBlock
	^ self addPlayer: ((MaNetworkPlayer name: aString) doBlock: aBlock)