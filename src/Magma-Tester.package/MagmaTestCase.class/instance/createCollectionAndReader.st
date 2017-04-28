test persistent reader
createCollectionAndReader
	| collection reader |
	collection := (MagmaCollection new)
		addIndex: (MaByteSequenceIndex attribute: #key) ;
		yourself.
	reader := collection where: 
		[ : rdr | 
		rdr 
			read: #key
			from: 'M'
			upTo: 'N' ].
	{  MaObject. Collection  } do: 
		[ : eachRoot | 
		eachRoot withAllSubclassesDo: 
			[ : each | 
			collection add: each name asString -> each hash	"meaningless for this test, other than let's not add the entire image to the class-definitions please" ] ].
	clientSession commit: 
		[ clientSession root 
			at: 'testPersistentReader.collection'
			put: collection.
		clientSession root 
			at: 'testPersistentReader.reader'
			put: reader ]