cached object access
firstIndexOfCachedObjectAtOrAfterKey: anObject 
	"anObject is the key.  Answer its indexed position within the receivers colllection of cached objects or the index of the object with the next higher key."
	| index hash |
	index := self collection indexNamed: expression attribute.
	hash := index indexHashForIndexObject: anObject.
	^ self segmentObjects
		ifEmpty: [ 0 ]
		ifNotEmpty:
			[ | nearestIndex |
			nearestIndex := self segmentObjects findNearbyBinaryIndex:
				[ : testedObject | | hashOfTested |
				hashOfTested := testedObject key.
				hash - hashOfTested ].
			"findNearby gives the next *lower* index rather than the next higher, so unless anObject exists, we need the next one."
			(nearestIndex
				between: 1
				and: self segmentObjects size)
				ifTrue:
					[ (self segmentObjects at: nearestIndex) key < hash
						ifTrue: [ nearestIndex + 1 ]
						ifFalse:
							[ "In the face of duplicate keys walk backward to ensure we get the first."
							[ nearestIndex > 1 and: [ (self segmentObjects at: nearestIndex - 1) key = hash ] ] whileTrue: [ nearestIndex := nearestIndex - 1 ].
							nearestIndex ] ]
				ifFalse: [ 0 ] ]