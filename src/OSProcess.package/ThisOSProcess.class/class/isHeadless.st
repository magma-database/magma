testing
isHeadless
	"Answer true if the image is known to be headless, otherwise assume
	that a user interface is present."

	(Smalltalk respondsTo: #isHeadless)
		ifTrue: [ ^Smalltalk perform: #isHeadless ].
	^ false "assume that a UI is present"