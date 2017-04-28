initialize
beAscii
	"Set up this index to include basic punctuation; 
		(0 to: 127) collect: [ : each | Character value: each ]
	This can only be called when the index is initially created, do not call this after the index is persistent."
	self 
		setLowChar: 0
		highChar: 127