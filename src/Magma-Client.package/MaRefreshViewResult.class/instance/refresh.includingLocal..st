actions
refresh: aMagmaSession includingLocal: aBoolean
	aMagmaSession
		refreshChangedObjects: toBeRefreshed includingLocal: aBoolean ;
		commitNumber: commitNumber ;
		oidCount: oidCount