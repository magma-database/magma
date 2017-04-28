initialize-release
initialize
	super initialize.
	(Smalltalk hasClassNamed: #MauiRegistry) ifTrue:
		[ (Smalltalk classNamed: #MauiRegistry) global
			register: (Smalltalk classNamed: #MauiCollectionMorph)
			forAny: self ]