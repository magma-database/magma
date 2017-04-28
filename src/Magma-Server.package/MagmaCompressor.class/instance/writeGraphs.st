private
writeGraphs
	| inputTraverser |
	inputTraverser := MagmaFileTraverser repositoryController: inputController.
	process knowsTaskSize ifFalse: [ self guessTaskSize ].
	process
		 description: 'Copying object graph...' ;
		 unitsVerbPhrase: 'objects traversed'.
	inputTraverser anchorGraphDo:
		[ : eachBuffer | process advance.
		process stopped ifFalse:
			[ self markClassReferenced: eachBuffer.
			(inputController isClassIdForLargeCollection: eachBuffer classId) ifTrue: [ self markCollectionReferenced: eachBuffer oid ].
			(MaOidCalculator isOidForUserObject: eachBuffer oid) ifTrue:
				[ outputFiler
					
					write: (self upgrade: eachBuffer)
					index: true ;
					 filesDo: [ : eachFile : eachFileId | eachFile maCommit ] ] ] ].
	^ inputTraverser objectCount