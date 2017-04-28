cached object access
indexOfCachedObject: anObject 
	self segmentObjects withIndexDo:
		[ : each : index | anObject = each value ifTrue: [ ^ index ] ].
	^ 0