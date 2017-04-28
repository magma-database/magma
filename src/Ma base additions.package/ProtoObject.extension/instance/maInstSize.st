*ma base additions
maInstSize
	"Answer the number of named and indexed instance variables referenced by
	the receiver."

	^self class instSize + self basicSize
