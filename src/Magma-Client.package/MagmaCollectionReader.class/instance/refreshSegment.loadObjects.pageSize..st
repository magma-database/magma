private
refreshSegment: aMagmaCollectionReaderSegment loadObjects: aBoolean pageSize: anInteger 
	aMagmaCollectionReaderSegment = self localAdditionsSegment ifFalse: 
		[ collection 
			refreshSegment: aMagmaCollectionReaderSegment
			where: expression
			pageSize: anInteger
			using: (self session ifNotNil: [ self session resetReadStrategy ])
			loadObjects: aBoolean ].
	self trunk: aMagmaCollectionReaderSegment trunk.
	self sortIndex ifNotNilDo: [ : sortIndex | aMagmaCollectionReaderSegment sortObjects: expression ascendingSortBlock ]