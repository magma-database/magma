initialize
beAlphaNumeric
	"Set up this index to include only alpha characters; 
		(48 to: 90) collect: [ : each | Character value: each ]
	This can only be called when the index is initially created, do not call this after the index is persistent."
	self 
		setLowChar: 48
		highChar: 90