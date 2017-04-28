private
filenameFor: keysOrOids of: aMagmaIndexDescription
	^ (String streamContents:
		[ : stream |
		stream
			nextPutAll: (self filenameComponentFor: aMagmaIndexDescription) ;
			nextPut: $- ;
			nextPutAll: keysOrOids ;
			nextPut: $. ;
			nextPutAll: MaHashIndex suggestedFileExtension ])