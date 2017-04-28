enumerating (slow)
associations
	^ Array streamContents:
		[ : stream | self associationsDo:
			[ : each | stream nextPut: each ] ]