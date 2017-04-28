private
nextSegment
	"In an empty MagmaCollection, we can't have any real segments, just one with no trunkEnd, so no need to try to get the 'next' one until we get our first valid one."
	^ self isFitted 
		ifTrue: 
			[ self maOriginalClass new
				startIndex: endIndex + 1 ;
				trunkStart: trunkEnd + 1 ;
				trunk: trunk ;
				yourself ]
		ifFalse: [ self ]