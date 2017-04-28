building
markRead: anObject using: aMaObjectBuffer 
	(session immutabilityStrategy
		isImmutable: anObject
		using: self) ifTrue: [ ^ anObject ].
	anObject isImmutableInMagma ifTrue: [ ^ anObject ].
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