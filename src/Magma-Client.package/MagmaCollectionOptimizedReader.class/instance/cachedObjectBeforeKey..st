cached object access
cachedObjectBeforeKey: anObject 
	^ (self segmentObjects
		at: (self firstIndexOfCachedObjectAtOrAfterKey: anObject) - 1
		ifAbsent: [ ^ nil ]) value