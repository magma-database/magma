compress
compressTo: outputLocation 
	| shouldCloseInput location objectCount sizeMsg |
	location := outputLocation asMagmaLocalLocation.
	shouldCloseInput := inputController isNil.
	inputController ifNil: [ self openInput ].
	objectCount := self
		 createOutput: location ;
		 copyPrimitiveAttributes ;
		 writeGraphs.
	self
		 ensureNoOidReuse ;
		 copyMagmaCollections.
	self postCompress.
	outputFiler close.
	sizeMsg := objectCount asString , ' objects transferred to the compressed repository.'.
	process description:
		(shouldCloseInput
			ifTrue:
				[ self close.
				'Done.  ' , sizeMsg , '  All repositories closed.' ]
			ifFalse: [ 'Done.  ' , sizeMsg , '  Input repository left open.' ])