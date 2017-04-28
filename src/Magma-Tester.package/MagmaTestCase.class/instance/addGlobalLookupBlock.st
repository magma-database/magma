test blocks
addGlobalLookupBlock
	clientSession commit:
		[ clientSession root
			at: #testGlobalLookupBlock
			put: [ : nm | Smalltalk at: nm ] ]