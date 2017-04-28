record
writeBeforeImageRecordsFrom: aMaAtomicFileStream fileId: fileId 
	| hasWrittenFileGrowth |
	hasWrittenFileGrowth := false.
	aMaAtomicFileStream writersDo: 
		[ : each | 
		each willCauseGrowth 
			ifTrue: 
				[ "Only need to write one of these."
				hasWrittenFileGrowth ifFalse: 
					[ self preMadeFileGrowthRecord
						originalSize: aMaAtomicFileStream committedSize ;
						fileId: fileId ;
						groupId: groupId ;
						writeTo: applyFile.
					hasWrittenFileGrowth := true ] ]
			ifFalse: 
				[ self preMadeBeforeImageRecord
					location: each filePos ;
					record: each currentRecord ;
					fileId: fileId ;
					groupId: groupId ;
					writeTo: applyFile ] ]