benchmarks-magmacollections
addThousandsOfObjectsOneHundredAtATime
	"This tests how long it takes to add a fixed number of objects to a MagmaCollection with no indexes."

	^ self addThousandsOfObjectsCommitEvery: 100