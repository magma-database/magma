other small tests
prepareUpdateByteObjects
	| root |
	root := clientSession root.
	clientSession commit: 
		[ root 
			at: 'testUpdateByteObjects'
			put: (Array 
					with: 'hello world'
					with: 'hello world' asByteArray) ]