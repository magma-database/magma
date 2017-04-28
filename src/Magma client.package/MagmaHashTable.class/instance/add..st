access
add: anObject 
	(index indexHashesFor: anObject) do:
		[ : each | table
			add: anObject
			at: each ].
	^ anObject