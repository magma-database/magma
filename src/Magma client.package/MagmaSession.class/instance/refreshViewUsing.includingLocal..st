private
refreshViewUsing: aMaRefreshViewResult includingLocal: aBoolean 
	"I have crossed a transaction boundary, either through abort, commit or begin."
	guard critical:
		[ self statistics refreshViewHistory addValue: (Time millisecondsToRun: [ aMaRefreshViewResult refresh: self ]).
		serializer resetNewObjects.
		aBoolean ifTrue:
			[ transaction resetCommitPackage.
			self resetMagmaCollectionChanges ].
		self isTimeToClean ifTrue:
			[ self statistics houseCleaningTimeHistory addValue:
				(Time millisecondsToRun:
					[ self
						 bulkBecomeProxies ;
						 finalizeOids ]) ] ]