testing
didChange: anObject 
	"Answer whether anObject has changed for this transaction."
	(session immutabilityStrategy
		isImmutable: anObject
		using: self) ifTrue: [ ^ false ].
	anObject isImmutableInMagma ifTrue: [ ^ false ].
	^ anObject isBehindWriteBarrier
		ifTrue: [ commitPackage includesObject: anObject ]
		ifFalse:
			[ "Under very heavy loads, its possible for a client to get disconnected during a long series of reads.  One of those reads could be in the middle of a materialization (maEstablishPointerReferencesFor:using:.  But since this happens before the call to #markRead:using:, it isn't in the readSet yet!)"
			self
				didChange: anObject
				from: (readSet at: anObject ifAbsent: [ ^ false ]) ]