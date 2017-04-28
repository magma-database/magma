class initialization
initialize
	Smalltalk hasMaui ifTrue:
		[ (Smalltalk classNamed: #MauiWorld) current registry
			register: (Smalltalk classNamed: #MauiCollectionMorph)
			forAny: self ]