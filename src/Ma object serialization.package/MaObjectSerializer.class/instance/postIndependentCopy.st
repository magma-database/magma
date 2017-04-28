private
postIndependentCopy
	"Answer a completely independent copy of the receiver.  This will probably mostly be used during debugging."

	self 
		oidManager: oidManager independentCopy;
		classIdManager: self classIdManager independentCopy;
		resetByteArray.
	graphBuffer := graphBuffer copy.
	traversalStrategy := traversalStrategy copy