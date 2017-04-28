building
add: anObject
	"Adds anObject as a main parent in the receiver."

	self
		add: anObject
		asChildOf: nil.
	^anObject
