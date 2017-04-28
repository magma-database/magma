private
refreshMyKnownObjects
	"Refresh all objects in the image retrieved by this session with their copies in the repository."
	"When a session has been offline for sometime, many of the objects it has in its oid Dictionary's could be out of date, and doing an abort after reconnecting won't update them because refreshes are only performed from transient information in the server (the repository's 'transactionLog').
	Therefore, enumerate all of my objects and refresh them."
	| allKnownOids allObjects |
	allObjects := OrderedCollection new: 1000.
	allKnownOids := OrderedCollection new: 1000.
	serializer oidsAndObjectsDo: 
		[ : eachOid : eachObject | 
		((eachObject maIsMutatingProxy and: [ eachObject maRealObjectIsReified not ]) not and: 
			[ eachObject maIsForwardingProxy not and: [ eachObject notNil and: [ eachObject isImmutableInMagma not ] ] ]) ifTrue: 
			[ allObjects add: eachObject realObjectIfMutatingProxy.
			allKnownOids add: eachOid.
			allKnownOids size >= 1000 ifTrue: 
				[ self refreshAllWithOids: allKnownOids.
				allKnownOids := OrderedCollection new: 1000 ] ] ].
	allKnownOids ifNotEmpty: [ self refreshAllWithOids: allKnownOids ]