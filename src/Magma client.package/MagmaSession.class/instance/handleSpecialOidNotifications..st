private
handleSpecialOidNotifications: aDictionary 
	"aDictionary is keyed by selector Symbols, with Array's of ByteArray's as values.  The selectors indicate what should be done with those ByteArray's once materialized."
	guard critical: 
		[ | didRefresh |
		didRefresh := false.
		"Refresh the node first, in case subsequent instructions require access to the server."
		(aDictionary includesKey: #refreshNode) ifTrue: 
			[ self refreshSpecialObjectsUsing: (aDictionary at: #refreshNode).
			"Make absolutely sure the node is materialized."
			self node locations do: [ : each | each yourself ] ].
		"Must do classDefinitions Dictionary first."
		(aDictionary includesKey: #refreshClassDefinitions) ifTrue: 
			[ didRefresh := true.
			self refreshSpecialObjectsUsing: (aDictionary at: #refreshClassDefinitions) ].
		"Now refresh individual OrderedCollections of MaClassDefinitions, each representing its own version."
		(aDictionary includesKey: #refreshClassVersions) ifTrue: 
			[ didRefresh := true.
			self refreshSpecialObjectsUsing: (aDictionary at: #refreshClassVersions) ].
		didRefresh ifTrue: [ self prepareReadStrategy ] ]