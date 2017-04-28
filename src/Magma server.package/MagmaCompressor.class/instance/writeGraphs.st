private
writeGraphs
	| inputTraverser |
	inputTraverser := MagmaFileTraverser repositoryController: inputController.
	inputTraverser anchorGraphDo: 
		[ : eachBuffer | 
		self markClassReferenced: eachBuffer.
		(inputController isClassIdForLargeCollection: eachBuffer classId) ifTrue: [ self markCollectionReferenced: eachBuffer oid ].
		(MaOidCalculator isOidForUserObject: eachBuffer oid) ifTrue: 
			[ outputFiler
				write: (self upgrade: eachBuffer)
					index: true ;
				filesDo: [ : eachFile : eachFileId | eachFile maCommit ] ] ]