cached object access
cachedObjectAtKey: anObject 
	^ (self segmentObjects
		at: (self indexOfCachedObjectAtKey: anObject)
		ifAbsent: [ ^ nil ]) value