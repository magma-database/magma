client
makeSureSymbolContainerMaterialized
	clientSession begin.
	clientSession definition symbols yourself.
	localRoot := clientSession root.
	(localRoot at: #testSymbolCanonicalization) yourself.
	^ nil