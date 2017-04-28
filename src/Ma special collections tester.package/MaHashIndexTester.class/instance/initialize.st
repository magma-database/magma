private initializing
initialize

	super initialize.
	values := Dictionary new.
	sortedKeys := SortedCollection new.
	nextValue := 2 raisedTo: 17  "some arbitrary number"