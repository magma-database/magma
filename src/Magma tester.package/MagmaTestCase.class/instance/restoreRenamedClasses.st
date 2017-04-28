initialize-release
restoreRenamedClasses

	(Smalltalk hasClassNamed: #MagmaRenamedContact) ifTrue:
		[ (Smalltalk classNamed: #MagmaRenamedContact) rename: #MagmaContact ]