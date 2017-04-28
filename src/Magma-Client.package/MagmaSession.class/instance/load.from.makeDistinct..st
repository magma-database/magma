private-magma collections
load: aMagmaCollection from: aMagmaCollectionReader makeDistinct: aBoolean 
	"Calls registerAndLoad:using:from:forSession:distinct:"
	| commitPackage refreshResult |
	guard critical: 
		[ commitPackage := MaCommitPackage new.
		commitPackage addLargeCollectionChanges: aMagmaCollection changes.
		"aMagmaCollection is a new object, so serializer will traverse it deeply enough."
		serializer 
			serializeGraph: aMagmaCollection
			do: [ : eachObject | commitPackage addObject: eachObject ].
		aMagmaCollection
			setOid: (self oidFor: aMagmaCollection) ;
			beNotPersistent.
		commitPackage objects: (serializer serializeGraph: commitPackage objects).
		refreshResult := self submit: (MaLoadFromReaderRequest new
				commitPackage: commitPackage ;
				expression: aMagmaCollectionReader expression ;
				distinct: aBoolean ;
				sourceCollectionOid: (self oidFor: aMagmaCollectionReader collection) ;
				yourself).
		self 
			refreshViewUsing: refreshResult
			includingLocal: false.
		"set it up as if it was created through normal transaction mechanism"
		aMagmaCollection session: self.
		transaction monitorLargeCollectionChanges: aMagmaCollection changes ]