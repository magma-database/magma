private
segmentSpanningKey: anInteger 
	^ segments 
		detect: 
			[ : each | 
			(each isFitted and: [ anInteger <= each highestKey ]) or: [ each atEnd ] ]
		ifNone: 
			[ "If we didn't find the spanning segment, and we're not at the end, then lets move forward toward the end until we do.."
			| desiredSegment |
			[ desiredSegment := self getNextSegmentAndLoadIf: [ : nextSeg | false ].
			desiredSegment isNil or: [ anInteger <= desiredSegment highestKey or: [ desiredSegment atEnd ] ] ] whileFalse.
			(desiredSegment notNil and: [ anInteger <= desiredSegment highestKey ]) ifTrue: [ desiredSegment ] ]