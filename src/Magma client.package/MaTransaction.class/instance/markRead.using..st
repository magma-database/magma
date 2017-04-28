building
markRead: anObject using: aMaObjectBuffer 
	anObject isImmutableInMagma ifTrue: 
		[ "can't change, don't bother recording my state."
		^ anObject ].
	(self useWriteBarrierOn: anObject) 
		ifTrue: 
			[ anObject isBehindWriteBarrier ifFalse: [ self add: anObject ].
			commitPackage removeObject: anObject ]
		ifFalse: 
			[ self 
				bufferFor: anObject
				is: aMaObjectBuffer ].
	anObject maIsLargeCollection ifTrue: 
		[ self monitorLargeCollectionChanges: anObject changes.
		anObject session: session ].
	^ anObject