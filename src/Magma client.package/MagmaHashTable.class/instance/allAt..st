access
allAt: keyObject 
	^ Array streamContents:
		[ : stream | self
			at: keyObject
			do:
				[ : each | stream nextPut: each value ] ]