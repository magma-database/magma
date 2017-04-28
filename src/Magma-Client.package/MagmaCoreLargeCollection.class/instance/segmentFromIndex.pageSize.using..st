private
segmentFromIndex: startIndex pageSize: anInteger using: aMaReadStrategy 
	"Answer a MaCollectionSegment."
	^ self isNewCollection 
		ifTrue: [ changes localSegment ]
		ifFalse: 
			[ session 
				upTo: anInteger
				objectsIn: self
				fromIndex: startIndex
				using: aMaReadStrategy ]