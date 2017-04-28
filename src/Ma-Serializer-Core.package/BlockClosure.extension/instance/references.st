*ma-serializer-core
references
self maMarked: 'delete'.
	^ Array streamContents:
		[ : stream | self referencesDo:
			[ : each | stream nextPut: each ] ]