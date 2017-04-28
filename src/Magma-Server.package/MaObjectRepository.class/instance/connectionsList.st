client-requests
connectionsList
	^ Array streamContents:
		[ : stream | self sessions do:
			[ : each | each isSystem ifFalse:
				[ stream
					 nextPut: each informationalCopy ;
					 yourself ] ] ]