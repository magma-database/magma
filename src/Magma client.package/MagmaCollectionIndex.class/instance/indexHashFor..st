private
indexHashFor: anObject 
	"Answer the Integer hash used to locate anObject."

	self validateCanIndex: anObject.
	^ self indexHashForIndexObject: (self indexObjectFor: anObject)