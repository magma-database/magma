initialize-release
initializeSerializer
	serializer := MaObjectSerializer new
		bpMapIndex: (MaObjectBuffer indexOfBpMap: MagmaBufferPositionMap) ;
		toCreateProxies: 
			[ : oid | 
			MagmaMutatingProxy 
				session: self
				oid: oid ] ;
		classIdManager: MagmaClassIdManager new ;
		oidManager: (MagmaOidManager new
				statistics: self statistics ;
				yourself) ;
		yourself.
	serializer traversalStrategy
		traverseWhen: 
			[ : path : parent : indexInteger | 
			(path last 
				maShouldTraverseWithPath: path
				parent: parent
				index: indexInteger) and: 
				[ path size <= 2 or: 
					[ "Because we're serializing an Array of only changed objects, we only need capture their first level, but don't forget the OC container is level 1."
					MaOidCalculator isOidForNewObject: (self oidFor: path last) ] ] ] ;
		valueWhen: 
			[ : path : parent : index | 
			(path last 
				maShouldAppendWithPath: path
				parent: parent
				index: index) and: 
				[ path size <= 2 or: [ MaOidCalculator isOidForNewObject: (self oidFor: path last) ] ] ].
	serializer preferences
		beforeSerializingAny: #MagmaForwardingProxy
			do: [ : aMagmaForwardingProxy | aMagmaForwardingProxy ensureReferencePopulated ] ;
		beforeSerializingAny: #Morph
			do: 
				[ : aMorph | 
				"(sigh) Morphs keep their own #updateableActionMap, the map used to hold event-listener definitions.  Before, we were setting up these listeners on *materialization*, but this was causing them to be marked dirty immediately.  Therefore, we go ahead and set these listeners up 'permanently' upon serialization."
				aMorph wantsMagmaEvents ifTrue: 
					[ aMorph 
						when: #magmaAboutToRefresh
						send: #aboutToRefreshFromMagma:
						to: aMorph.	"aMagmaRefreshEvent"
					aMorph 
						when: #magmaRefreshed
						send: #refreshedFromMagma:
						to: aMorph	"aMagmaRefreshEvent".
					aMorph formerOwner: nil ] ] ;
		afterMaterializingAny: #MagmaCoreLargeCollection
			do: 
				[ : aMagmaCollection | 
				aMagmaCollection
					initializeChangesUsing: aMagmaCollection ;
					setOid: (serializer oidFor: aMagmaCollection) ].
	MagmaCollectionReader withAllSubclasses do: 
		[ : each | 
		serializer preferences 
			afterMaterializingAny: each name
			do: 
				[ : aMagmaCollectionReader | 
				aMagmaCollectionReader
					fixUpExpression ;
					setUpListener ;
					refresh ] ]