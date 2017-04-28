private
merge: oneArgBlock at: hashKey advance: anInteger 
	| containingSegment |
	containingSegment := self segmentSpanningKey: hashKey.
	containingSegment ifNil: [ ^ self ].
	oneArgBlock value: containingSegment.
	containingSegment advanceEnd: anInteger.
	self 
		segmentsAfter: containingSegment
		do: [ : eachSegment | eachSegment advanceStart: anInteger ]