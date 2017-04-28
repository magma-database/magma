benchmarks-magmacollections
addThousandsOfObjectsAtOnce
	"This tests how long it takes to add a fixed number of objects, one at a time, to a MagmaCollection with no indexes."
	self focusOn: #magmaCollectionFixture.
	session abort.	"ensure not in a transaction."
	^ ((Time millisecondsToRun: 
		[ session commit: 
			[ 1 
				to: self thousands
				do: [ : n | self magmaCollectionFixture add: Array new ] ] ]) / 1000.0) printString , ' seconds.'