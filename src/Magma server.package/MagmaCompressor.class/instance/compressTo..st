compress
compressTo: outputLocation 
	| shouldCloseInput location |
	location := outputLocation asMagmaLocalLocation.
	shouldCloseInput := inputController isNil.
	inputController ifNil: [ self openInput ].
	self
		createOutput: location ;
		copyPrimitiveAttributes ;
		writeGraphs ;
		ensureNoOidReuse ;
		copyMagmaCollections.
	self postCompress..
	outputFiler close.
	shouldCloseInput ifTrue: [ inputController close ]