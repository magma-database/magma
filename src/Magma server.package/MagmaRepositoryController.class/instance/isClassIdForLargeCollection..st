testing
isClassIdForLargeCollection: anInteger 
	session serializer classIdManager largeCollectionIdsDo: [ : each | each = anInteger ifTrue: [ ^ true ] ].
	^ false