building
onAny: aClass readToDepth: anInteger 
	self beNew.
	^ depthSpecifications 
		at: aClass
		put: anInteger