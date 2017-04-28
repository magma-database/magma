*magma tester
simulateOutage
	MagmaServerPreferences debugRecovery ifTrue: [ self halt: 'about to kill image' ].
	(Smalltalk hasClassNamed: #MagmaCollectionIndex) ifTrue: 
		[ self halt: 'MagmaCollectionIndex should not be present in the server image.' ].
	SmalltalkImage current quitPrimitive