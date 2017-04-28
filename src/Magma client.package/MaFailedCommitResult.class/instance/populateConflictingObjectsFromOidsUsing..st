building
populateConflictingObjectsFromOidsUsing: aMaObjectSerializer

	commitConflicts do: [ :each | each initializeConflictingObjectsUsing: aMaObjectSerializer ]
