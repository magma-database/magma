private
handleSpecialOidNotifications: aDictionary 
	"aDictionary is keyed by selector Symbols, with Array's of ByteArray's as values.  The selectors indicate what should be done with those ByteArray's once materialized."
	guard critical:
		[ | didRefresh |
		didRefresh := false.
		"Refresh the node first, in case subsequent instructions require access to the server."
		(aDictionary includesKey: #refreshNode) ifTrue:
			[ self
				 refreshSpecialObjectsUsing: (aDictionary at: #refreshNode) ;
				 ensureNodeFullyMaterialized ].
		((aDictionary includesKey: #refreshClassDefinitions) or: [ aDictionary includesKey: #refreshClassVersions ]) ifTrue:
			[ didRefresh := true.
			self
				 refreshSpecialObjectsUsing: (aDictionary at: #refreshClassDefinitions) ;
				 ensureClassDefinitionsFullyMaterialized ].
		"Uncomment the next line when we decide to support lockable RepositoryDefinitions."
		"		(aDictionary includesKey: #refreshDefinition) ifTrue: [ self refreshSpecialObjectsUsing: (aDictionary at: #refreshDefinition) ]."
		didRefresh ifTrue: [ self prepareReadStrategy ] ]