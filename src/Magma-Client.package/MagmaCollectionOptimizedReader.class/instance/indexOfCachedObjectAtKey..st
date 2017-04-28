cached object access
indexOfCachedObjectAtKey: anObject 
	| index hash |
	index := self collection indexNamed: expression attribute.
	hash := index indexHashForIndexObject: anObject.
	^ self segmentObjects
		findBinaryIndex:
			[ : testedObject | hash - testedObject key ]
		ifNone: [ 0 ]