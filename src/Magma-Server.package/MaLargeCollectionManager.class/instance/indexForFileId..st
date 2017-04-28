recovery
indexForFileId: anInteger
	"To support recovery of LargeCollections, we must replace the applied records to their prior-state, which is contained inside MaBeforeImageRecords."

	^ memberIndex "the only possibility"