notifications
noteResponseSerializationError: anException lifecycle: aMaServerRequestLifecycle 
	(anException isKindOf: OutOfMemory) ifTrue: [ MaObjectRepository freeSomeSpace ].
	^ super noteResponseSerializationError: anException lifecycle: aMaServerRequestLifecycle