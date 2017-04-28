private
refreshSegment: aMagmaCollectionReaderSegment where: aMaTerm pageSize: anInteger using: aMaReadStrategy loadObjects: aBoolean 
	"Answer a MagmaCollectionSegment."
	self isNewCollection 
		ifTrue: 
			[ changes 
				refreshSegment: aMagmaCollectionReaderSegment
				where: aMaTerm ]
		ifFalse: 
			[ "if refreshing the local 'segment' it will have its old page of objects, clear it out."
			aMagmaCollectionReaderSegment initializeObjects.
			session 
				refreshSegment: aMagmaCollectionReaderSegment
				of: self
				where: aMaTerm
				pageSize: anInteger
				using: aMaReadStrategy
				loadObjects: aBoolean ]