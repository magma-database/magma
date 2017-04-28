player access
playerNamed: aString 
	^ players
		detect: [ : each | each name = aString ]
		ifNone: [ nil ]