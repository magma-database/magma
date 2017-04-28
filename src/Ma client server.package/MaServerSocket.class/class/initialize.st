initializing
initialize
	ActiveSockets ifNotNil: [ ActiveSockets do: [ : each | each shutdown ] ].
	ActiveSockets := Set new.
	Smalltalk
		addToStartUpList: self ;
		addToShutDownList: self