other small tests
createMagmaCollectionAndIndexSimultaneously
	| root mc |
	root := clientSession root.
	mc := MagmaCollection new.
	mc addIndex: (MaDateIndex attribute: #date).
	clientSession commit: 
		[ root 
			at: 'testCreateMagmaCollectionAndIndexSimultaneously'
			put: mc ]