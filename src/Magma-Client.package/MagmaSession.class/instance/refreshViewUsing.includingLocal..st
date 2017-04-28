private
refreshViewUsing: aMaRefreshViewResult includingLocal: aBoolean 
	"I have crossed a transaction boundary, either through abort, commit or begin."
	guard critical:
		[ self statistics refreshViewHistory addValue: (Time millisecondsToRun: [ aMaRefreshViewResult refresh: self includingLocal: aBoolean ]).
		serializer resetNewObjects.
		transaction resetNewLargeCollections.
		aBoolean ifTrue:
			[ transaction resetCommitPackage.
			self resetMagmaCollectionChanges ].
		self cleanIfTime ]