cached object access
cachedObjectAfterKey: anObject 
	| index |
	index := self lastIndexOfCachedObjectAtOrBeforeKey: anObject.
	^ index isZero ifFalse:
		[ (self segmentObjects
			at: index + 1
			ifAbsent: [ ^ nil ]) value ]