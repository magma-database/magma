cached object access
lastIndexOfCachedObjectAtOrBeforeKey: anObject 
	"anObject is the key.  It must already be IN RANGE of the receivers cached objects.  Answer the index of in my segmentObjects whose key is NOT AFTER anObject; e.g., at or before anObject.  In the case where there are multiple instances with key anObject, answer the index of the last one."
	| index hash |
	index := self collection indexNamed: expression attribute.
	hash := index indexHashForIndexObject: anObject.
	^ self segmentObjects
		ifEmpty: [ 0 ]
		ifNotEmpty:
			[ | nearestIndex |
			nearestIndex := self segmentObjects findNearbyBinaryIndex:
				[ : testedObject | hash - testedObject key ].
			(nearestIndex
				between: 1
				and: self segmentObjects size)
				ifTrue:
					[ [ nearestIndex < self segmentObjects size and: [ (self segmentObjects at: nearestIndex + 1) key = hash ] ] whileTrue: [ nearestIndex := nearestIndex + 1 ].
					nearestIndex ]
				ifFalse: [ 0 ] ]