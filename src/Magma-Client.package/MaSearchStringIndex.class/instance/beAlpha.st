initialize
beAlpha
	"Set up this index to include only alpha characters; 
		(65 to: 90) collect: [ : each | Character value: each ]
	This can only be called when the index is initially created, do not call this after the index is persistent."
	self 
		setLowChar: 65
		highChar: 90