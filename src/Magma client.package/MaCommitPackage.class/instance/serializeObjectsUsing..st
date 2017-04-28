building
serializeObjectsUsing: aMagmaSession 
	"Serialize my 'objects' into a MaSerializedGraphBuffer since the server does not deal with objects, just their buffers."
	| mustReserialize serializer numberOfClassesBefore |
	serializer := aMagmaSession serializer.
	numberOfClassesBefore := serializer classIdManager numberOfClasses.
	mustReserialize := false.
	
	[ objects := serializer 
		serializeGraph: objects
		do: 
			[ : each | 
			"Determine if class definition of each has changed."
			(serializer classIdManager hasClassDefinitionFor: each maSerializationClass) ifFalse: 
				[ mustReserialize := true.
				serializer classIdManager assimilateInImageDefinition: each maSerializationClass ].
			(each maIsLargeCollection and: 
				[ self allLargeCollectionChanges noneSatisfy: [ : eachChanges | eachChanges collectionOid = each changes collectionOid ] ]) ifTrue: 
				[ mustReserialize := mustReserialize or: [ (aMagmaSession isMonitoringLargeCollection: each) not ].
				aMagmaSession monitorLargeCollection: each ].
			each isMagmaId ifTrue: 
				[ | canonicalizedId |
				(aMagmaSession definition hasCanonicalizedMagmaId: each) ifFalse: [ mustReserialize := true ].
				canonicalizedId := aMagmaSession definition ensureCanonicalizedMagmaId: each.
				canonicalizedId ~~ each ifTrue: 
					[ "This should only occur if an application creates multiple instances of a proxy to a non-persistent object."
					each 
						becomeForward: canonicalizedId
						copyHash: false.
					mustReserialize := true ] ] ] ] 
		on: MaTraverseProxyNotification
		do: 
			[ : error | 
			error proxy mutatingProxySession = aMagmaSession 
				ifTrue: [ error resume ]
				ifFalse: 
					[ MagmaUserError signal: 'You should only share copies, not the same instances, across sessions.' ] ].
	self serializeLargeCollectionsChangesUsingCopyOf: serializer.
	^ mustReserialize or: [ serializer classIdManager numberOfClasses > numberOfClassesBefore ]