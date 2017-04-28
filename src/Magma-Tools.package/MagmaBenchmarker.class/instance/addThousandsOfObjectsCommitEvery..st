benchmarks-magmacollections
addThousandsOfObjectsCommitEvery: batchSize 
	"This tests how long it takes to add a fixed number of objects, one at a time, to a MagmaCollection with no indexes."
	"Ensure the collection is already created, so we only measure the add pace."
	session commit: [ self magmaCollectionFixture ].
	self focusOn: #magmaCollectionFixture.
	Smalltalk garbageCollect.
	session
		finalizeOids ;
		abort ;
		begin.
	^ ((Time millisecondsToRun: 
		[ 1 
			to: self thousands
			do: 
				[ : n | 
				self magmaCollectionFixture add: Array new.
				n \\ batchSize = 0 ifTrue: [ session commitAndBegin ] ].
		[ session inTransaction ] whileTrue: [ session commit ] ]) / 1000.0) printString , ' seconds.'