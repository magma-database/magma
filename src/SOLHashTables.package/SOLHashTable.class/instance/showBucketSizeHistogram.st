debugging
showBucketSizeHistogram
	"Write a bucket size histogram to the transcript."

	| histogram numDummies numNodes numCollisions prevKey currKey |
	histogram := Dictionary new.
	numDummies := 0.
	numNodes := 0.
	numCollisions := 0.
	prevKey := 0.
	currKey := 0.
	"Run through the node list, counting bucket sizes."
	self allNodesDo:
	    [ :node |
	     (node dummy) ifTrue:
		    [(numDummies > 0) ifTrue:
			    ["We're at the end of a bucket, add an observation to the histogram."
				histogram at: numNodes put: ((histogram at: numNodes ifAbsent: [0]) + 1)].
			numNodes := 0.
			numDummies := numDummies + 1]
		ifFalse:
		    [numNodes := numNodes + 1.
			(prevKey = (currKey := node key)) ifTrue:
			    [numCollisions := numCollisions + 1]
			ifFalse:
			    [prevKey := currKey]]].
	(numDummies > 0) ifTrue:
	    ["We're at the end of the last bucket, add an observation to the histogram."
		histogram at: numNodes put: ((histogram at: numNodes ifAbsent: [0]) + 1)].
	"We have the histogram data, now display it."
	Transcript cr; show: '---------- SOLHashTable bucket size histogram, ';
	             show: numDummies printString; show: ' buckets, ';
	             show: numElements printString; show: ' values ';
	             show: numCollisions printString; show: ' collisions'; cr;
	             show: ' size :  count'; cr..
	(histogram keysSortedSafely) do:
	    [ :key |
		Transcript show: (key printPaddedWith: $  to: 5); show: ' :'; show: ((histogram at: key) printPaddedWith: $  to: 8); cr].