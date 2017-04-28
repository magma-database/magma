private
indexHashesFor: anObject 
	"Answer an Integer or Array of Integers that will be used to locate the receiver."

	self validateCanIndex: anObject.
	^self indexHashesForIndexObject: (self indexObjectFor: anObject)
