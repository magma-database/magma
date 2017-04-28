accessing
allAt: hashKey 
	^ Array streamContents:
		[ : stream | self
			at: hashKey
			do:
				[ : each | stream nextPut: each value ] ]