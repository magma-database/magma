copying
independentCopy
	"Answer a completely independent copy of the receiver.  This will probably mostly be used during debugging."
self maMarked: 'delete'.
	^ self copy postIndependentCopy