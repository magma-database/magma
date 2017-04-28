removed
removedOids
	^ self hasRemoved 
		ifTrue: [ self removed keys collect: [ : each | self session oidFor: each ] ]
		ifFalse: 
			[ #() ]