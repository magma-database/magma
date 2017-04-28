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
			each isSymbol ifTrue: 
				[ mustReserialize := (aMagmaSession definition symbols addNewElement: each) or: [mustReserialize] ].
			each isMagmaId ifTrue: 
				[ | canonicalizedId |
				(aMagmaSession definition hasCanonicalizedMagmaId: each) ifFalse: [ mustReserialize := true ].
				canonicalizedId := aMagmaSession definition ensureCanonicalizedMagmaId: each.
				canonicalizedId ~~ each realObjectIfMutatingProxy ifTrue: 
					[ "This only occurs when an application creates mulitple ForwardingProxy instances to remote objects in another repository.  We want every equivalent instance in the model replaced with THE canoncalized one in the RepositoryDefinition so node updates are seen by all."
					serializer cleanObject: each.
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
					[ MagmaSoftwareError signal: 'You should only share copies, not the same instances, across sessions.' ] ].
	self serializeLargeCollectionsChangesUsingCopyOf: serializer.
	^ mustReserialize or: [ serializer classIdManager numberOfClasses > numberOfClassesBefore ]