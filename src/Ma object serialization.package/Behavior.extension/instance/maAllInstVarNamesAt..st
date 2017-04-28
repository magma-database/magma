*ma object serialization
maAllInstVarNamesAt: anInteger

	| x |
	x := 0.
	self maAllInstVarNamesDo:
		[ : each | 
		x := x + 1.
		x = anInteger ifTrue: [ ^ each ] ].
	self error: 'Index out of bounds:  ', anInteger printString