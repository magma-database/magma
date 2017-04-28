other small tests
performDoubleUpdate
	| root |
	root := clientSession root.
	clientSession commit: 
		[ root 
			at: 'testDoubleUpdate'
			put: 3 -> 4 ].
	clientSession commit: 
		[ root 
			at: 'testDoubleUpdate'
			put: 'three' -> 'four' ].
	clientSession commit: 
		[ root 
			at: 'testDoubleUpdate'
			put: 5 -> 6 ]