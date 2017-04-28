private
segmentContaining: anInteger 
	"My expression is complex, an object at anInteger is being requested.  If I have previously loaded the segment containing anInteger, switch to it immediately from my cached 'segments'.  Otherwise, keep getting the next segment until we have the requested index."
	| desiredSegment |
	^ segments 
		maDetect: [ : each | each includesIndex: anInteger ]
		ifFound: 
			[ : foundSegment | 
			self 
				refreshSegment: foundSegment
				loadObjects: true.
			foundSegment ]
		ifNone: 
			[ 
			[ desiredSegment := self getNextSegmentAndLoadIf: 
				[ : nextSeg | 
				nextSeg endIndex isNil or: [ nextSeg includesIndex: anInteger ] ].
			desiredSegment isNil or: [ (desiredSegment includesIndex: anInteger) or: [ desiredSegment atEnd ] ] ] whileFalse.
			desiredSegment ]