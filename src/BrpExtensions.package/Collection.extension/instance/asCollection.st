*BrpExtensions
asCollection
	"Answer a pointer collection with the receiver as the first-element."
	^ self class isPointers
		ifTrue: [ super asCollection ]
		ifFalse: [ Array with: self ]