initialize
bePunctuated
	"Set up this index to include basic punctuation; 
		(33 to: 96) collect: [ : each | Character value: each ]
	This can only be called when the index is initially created, do not call this after the index is persistent."
	self 
		setLowChar: 33
		highChar: 96