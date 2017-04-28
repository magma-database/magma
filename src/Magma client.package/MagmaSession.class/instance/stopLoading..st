large collections
stopLoading: aMagmaCollection 
	"If aMagmaCollection was created from a 'luxury' query, and it is still loading on the server, instruct the server to stop.  This can save many server resources for queries that are no longer needed.
	If aMagmaCollection is not being loaded, or not created from a luxury query, this message has no effect.
	This is an asynchronous message, so it returns instantly."
	(MaOidCalculator isOidForNewObject: aMagmaCollection changes collectionOid) ifFalse: 
		[ self submit: (MagmaReleaseReaderRequest new
				collectionOid: aMagmaCollection changes collectionOid ;
				yourself) ].
	transaction releaseLargeCollectionChanges: aMagmaCollection changes