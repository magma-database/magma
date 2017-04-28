private-report generation
looksLikeAnchorBuffer: aMaObjectBuffer 
	| stream |
	stream := WriteStream on: String new.
	self 
		printProblemsWithAnchorBuffer: aMaObjectBuffer
		on: stream.
	^ stream isEmpty