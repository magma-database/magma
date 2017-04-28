private
initializeBucket: bucketNum
	"Each bucket in the table points at a dummy SOLHashNode, so we want to create the dummy and insert it into the appropriate spot.
	 We look for the parent bucket to find the closest place to perform the insertion.
	 The very first bucket is a special case because there is neither parent nor segments yet."

	| parent dummy parentNum |
	parent := nil.
	parentNum := 0.
	(0 ~= bucketNum) ifTrue:
	    ["There is a parent node to look for."
		parentNum := SOLHashTable bitParent: bucketNum.
		(parent := self bucketAt: parentNum) ifNil:
		    ["Parent bucket has not been initialized yet either,  Do so recursively."
			parent := self initializeBucket: parentNum]].
	"Create the dummy node."
	dummy := frame insertDummy: (self dummyKey: bucketNum) in: parent.
	"Transcript cr; show: '+++++ initiaizing bucket ',(bucketNum printString),' key#',(dummy key printStringRadix:16); cr."
	^self bucketAt: bucketNum putNode: dummy
	